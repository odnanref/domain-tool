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
	"time"

	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

func createMyRender() multitemplate.Renderer {
	r := multitemplate.NewRenderer()
	r.AddFromFiles("insert", "templates/base.html", "templates/form.html")
	r.AddFromFiles("edit", "templates/base.html", "templates/form_edit.html")
	r.AddFromFiles("home", "templates/base.html", "templates/list.html")
	return r
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

func handleGet(c *gin.Context) {
	domains, err := database.GetAll()
	if err != nil {
		c.String(500, "1 Failed to get domain info %v", err)
		return
	}

	c.HTML(200, "home", gin.H{"domains": domains})
	return
}
