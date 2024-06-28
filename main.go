// main.go
package main

import (
	"database/sql"
	"fmt"
	"time"
	"log"
	"os"

	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

// DomainInfo represents the structure you provided
type DomainInfo struct {
	Name        string
	Registrar   string
	State	    string
	Tier	    string
	TransferTo  string
	LastCheck   time.Time
	Spf         string
	Dmarc       string
	Nameservers string
}

var db *sql.DB

// getDomainInfo queries the domain information by name
func getDomainInfo(db *sql.DB, domainName string) (*DomainInfo, error) {
    query := "SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers FROM domain_info WHERE name = $1"
    var domain DomainInfo
    err := db.QueryRow(query, domainName).Scan(
        &domain.Name,
        &domain.Registrar,
        &domain.State,
        &domain.Tier,
        &domain.TransferTo,
        &domain.LastCheck,
        &domain.Spf,
        &domain.Dmarc,
        &domain.Nameservers,
    )
    if err != nil {
        if err == sql.ErrNoRows {
            return nil, fmt.Errorf("no domain found with name: %s", domainName)
        }
        return nil, err
    }

    return &domain, nil
}

func getDomainInfoHistoryAllByDomain(db *sql.DB, domainName string) ([]DomainInfo, error) {
    query := "SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers FROM domain_info_history WHERE name = $1 "
    rows, err := db.Query(query, domainName)

    if err != nil {
        return nil, err
    }
    
    defer rows.Close()

    var domains []DomainInfo
    for rows.Next() {
        var domain DomainInfo
        if err := rows.Scan(
        	&domain.Name,
        	&domain.Registrar,
        	&domain.State,
        	&domain.Tier,
        	&domain.TransferTo,
        	&domain.LastCheck,
        	&domain.Spf,
        	&domain.Dmarc,
        	&domain.Nameservers,
    	); err != nil {
    
            return nil, err
        }

	domains = append(domains, domain)
    }
    if err := rows.Err(); err != nil {
        return nil, err
    }

    return domains, nil
}

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

	var err error
	db, err = sql.Open("postgres", "postgres://postgres:enlabium-invictus@localhost/domaintool?sslmode=disable")
	if err != nil {
		panic(err)
	}
	defer db.Close()

	r.GET("/details", handleFormEdit)
	r.GET("/form", handleForm)
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
	domainInfo, err := getDomainInfo(db, domain)
	domainInfoHistory, err := getDomainInfoHistoryAllByDomain(db, domain)

	if err != nil {
          log.Fatal(err)
	  c.HTML(500, "error.html", nil)
	  return
	}
	c.HTML(200, "edit", gin.H { "domain": domainInfo, "history": domainInfoHistory})
	return
}

func handleSubmit(c *gin.Context) {

	domain := DomainInfo{
		Name:        c.PostForm("name"),
		Registrar:   c.PostForm("registrar"),
		State:   c.PostForm("state"),
		Tier:   c.PostForm("tier"),
		TransferTo:  c.PostForm("transferTo"),
		LastCheck:   time.Now(),
		Spf:         c.PostForm("spf"),
		Dmarc:       c.PostForm("dmarc"),
		Nameservers: c.PostForm("nameservers"),
	}

	err := insertDomainInfo(domain)
	if err != nil {
		log.Println(err)
		c.String(500, "Failed to insert domain info %v", err)
		return
	}

}

func insertDomainInfo(domain DomainInfo) error {
	_, err := db.Exec("INSERT INTO domain_info (name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)",
		domain.Name, domain.Registrar, domain.State, domain.Tier, domain.TransferTo, domain.LastCheck, domain.Spf, domain.Dmarc, domain.Nameservers)
	return err
}

func handleGet(c *gin.Context) {
	rows, err := db.Query("SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers FROM domain_info")
	if err != nil {
		c.String(500, "1 Failed to get domain info %v", err)
		return
	}
	defer rows.Close()

	var domains []DomainInfo
	for rows.Next() {
		var domain DomainInfo
		err := rows.Scan(&domain.Name, &domain.Registrar, &domain.State, &domain.Tier, &domain.TransferTo, &domain.LastCheck, &domain.Spf, &domain.Dmarc, &domain.Nameservers)
		if err != nil {
			c.String(500,  "2 Failed to scan domain info %s", err)
			return
		}
		domains = append(domains, domain)
	}

	c.HTML(200, "home", gin.H{"domains": domains})
	return
}

