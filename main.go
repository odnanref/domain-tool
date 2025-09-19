// main.go
package main

import (
	"domaintool/database"
	"domaintool/models"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
	"text/template"
	"time"

	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

func createMyRender() multitemplate.Renderer {

	funcMap := template.FuncMap{
		"safeSpf":   safeSpf,
		"safeDmarc": safeDmarc,
		"checkWhoisIsExpiring": checkWhoisIsExpiring,
	}

	r := multitemplate.NewRenderer()
	r.AddFromFilesFuncs("insert", funcMap, "templates/base.html", "templates/form.html")
	r.AddFromFilesFuncs("edit", funcMap, "templates/base.html", "templates/form_edit.html")
	r.AddFromFilesFuncs("home", funcMap, "templates/base.html", "templates/list.html")
	return r
}

func safeSpf(spf string) int {
	if strings.Contains(spf, "-all") {
		return 2
	}
	if strings.Contains(spf, "~all") {
		return 3
	}
	return 0
}

func safeDmarc(dmarc string) int {
	if strings.Contains(dmarc, "p=none") {
		return 2
	}
	if strings.Contains(dmarc, "p=reject") {
		return 3
	}

	if strings.Contains(dmarc, "p=quarantine") {
		return 4
	}
	return 0
}


func getAfter(word string) string {
	key := "expirationDate:"

    // Find the index where the key starts
    startIndex := strings.Index(word, key)
    if startIndex == -1 {
        fmt.Println("Key not found!")
        return ""
    }

    // Move the startIndex to the end of the key to get the substring after the key
    startIndex += len(key)

    // Extract the substring starting from startIndex
    result := word[startIndex:]

    // Optional: Trim any leading or trailing spaces or commas
    result = strings.TrimSpace(result)
    if commaIndex := strings.Index(result, ","); commaIndex != -1 {
        result = result[:commaIndex]
    }

	return result
}

// Returns false if the date is not expired
// Returns true if the date is about to be expired in more than 30 days and less than 30
func checkWhoisIsExpiring(whois string) bool {
	if strings.Contains(whois, "expirationDate") {
		tmp := strings.Split(whois, ",")
		if len(tmp) <=0 {
			return true
		}
		dateString := ""
		for _, value := range tmp {
			if strings.Contains(value, "expirationDate") {
				tmp2 := getAfter(value)
				if len(tmp2) > 0 {
					dateString = tmp2
				} else {
					return false
				}
			}
		}
		log.Println("String Date ", dateString)
		// 2024-11-14T15:14:31Z
		parsedDate, err := time.Parse(time.RFC3339, dateString)
    	if err != nil {
    	    log.Println("Error parsing date:", err)
    	    return false
    	}

    	// Get the current date and time
    	currentDate := time.Now()

    	// Add 4 days to the current date
    	futureDate := currentDate.AddDate(0, 0, 1)
    	futurePreviousDate := currentDate.AddDate(0, 0, 100)
    	// previousDatePrevious := currentDate.AddDate(0, 0, -14)

    	// Compare the parsed date with the future date
    	if parsedDate.After(futureDate) && parsedDate.Before(futurePreviousDate) {
    	    log.Println("The date is more than 30 days after the current date.")
			return true
    	}

		log.Println("The date is not in the expected timeframe.")
		return false
	}
	return false
}

func main() {
	fmt.Println("Started server...")
	r := gin.Default()
	r.Static("/docs", "./public/docs")
	r.Static("/css/", "./public/css/")
	r.Static("/js/", "./public/js/")

	// Load templates
	r.HTMLRender = createMyRender()

	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbHost := os.Getenv("DB_HOST")
	dbName := os.Getenv("DB_NAME")

	dsn := fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable",
		dbUser, dbPassword, dbHost, dbName)

	database.Initialize(dsn)
	defer database.Close()

	r.GET("/details", handleFormEdit)
	r.GET("/add", handleForm)
	r.POST("/submit", handleSubmit)
	r.GET("/disable", handleDisable)
	r.GET("/", handleGet)

	r.Run(":8080")
}

func handleForm(c *gin.Context) {
	c.HTML(200, "insert", nil)
	return
}

func handleFormEdit(c *gin.Context) {
	fmt.Println("FORM EDIT")
	domain := c.Query("domain")
	// Query the domain information
	domainInfo, err := database.GetDomainInfo(domain)
	domainInfoHistory, err := database.GetDomainInfoHistoryAllByDomain(domain)

	if err != nil {
		log.Fatal(err)
		c.HTML(500, "error.html", nil)
		return
	}
	c.HTML(200, "edit", gin.H{"domain": domainInfo, "history": domainInfoHistory})
	return
}

func handleSubmit(c *gin.Context) {
	status, err := strconv.ParseBool(c.PostForm("status"))

	if err != nil {
		log.Fatal("Got Error in Status: ", err)
		c.HTML(500, "error.html", nil)
		return
	}

	_, exists_err := database.GetDomainInfo(c.PostForm("name"))

	domain := models.DomainInfo{
		Name:        c.PostForm("name"),
		Registrar:   c.PostForm("registrar"),
		State:       c.PostForm("state"),
		Tier:        c.PostForm("tier"),
		TransferTo:  c.PostForm("transferTo"),
		LastCheck:   time.Now(),
		Spf:         c.PostForm("spf"),
		Dmarc:       c.PostForm("dmarc"),
		Nameservers: c.PostForm("nameservers"),
		Status:      status,
		Whois:		 c.PostForm("whois"),
	}

	if exists_err != nil {
		in_err := database.InsertDomainInfo(domain)
		if in_err != nil {
			log.Println(in_err)
			c.String(500, "Failed to insert domain info %v", in_err)
			return
		}
	} else {
		updt_err := database.UpdateDomainInfo(domain)
		if updt_err != nil {
			log.Println(updt_err)
			c.String(500, "Failed to Update domain info %v", updt_err)
			return
		}
	}

	c.Redirect(http.StatusFound, "/")

}

func handleDisable(c *gin.Context) {
	fmt.Println("FORM Disable")
	domain := c.Query("domain")
	// Query the domain information
	err := database.DisableDomain(domain)
	if err != nil {
		log.Fatal(err)
		c.JSON(http.StatusServiceUnavailable, gin.H{
        "message": "Failed updating domain.",
        "status":  "Error",
    })
		return
	}

	c.JSON(http.StatusOK, gin.H{
        "message": "Update Successful",
        "status":  "ok",
    })
	return
}

func handleGet(c *gin.Context) {
	domains, err := database.GetAll()
	if err != nil {
		c.String(500, "1 Failed to get domain info %v", err)
		return
	}

	c.HTML(200, "home", gin.H{"domains": domains})
	return
}
