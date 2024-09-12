// updater.go
package main

import (
	"fmt"
	"strings"
	"log"
	"os"
	"time"
	"domain-tool-updater/models"
	"domain-tool-updater/database"
	"domain-tool-updater/dnsquery"

	_ "github.com/lib/pq"
)

func joinMapByColon(m map[string]string) string {
    var pairs []string
    for key, value := range m {
        pairs = append(pairs, key+":"+value)
    }
    return strings.Join(pairs, ", ")
}

func main() {
	fmt.Println("Started Updater...")

	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbHost := os.Getenv("DB_HOST")
	dbName := os.Getenv("DB_NAME")
	
	dsn := fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable",
		dbUser, dbPassword, dbHost, dbName)
	
	database.Initialize(dsn)
	defer database.Close()

	domains, err := database.GetDomainInfoAll()
	if err != nil {
		log.Printf("ERROR: Rows iteration error: %v", err)
		panic("ERROR Getting all domains")
	}

	for _, domain := range domains {
		domain_stored, StorageErr := database.GetDomainInfoHistory(domain.Name)

		log.Println("Domain being checked: ", domain.Name)
		nsRecords, err := dnsquery.GetNSRecords(domain.Name)
		nsRecordcomma := ""
		if err != nil {
			log.Println("Domain NS Record not found ", domain.Name)
		} else {
			for _, ns := range nsRecords {
				nsRecordcomma = nsRecordcomma + ", " + ns
			}
		}
		database.UpdateNS(domain.Name, nsRecordcomma)
		if StorageErr == nil {
			if nsRecordcomma != domain_stored.Nameservers {
				//alert
			}
		}

		dmarcRecord, err := dnsquery.GetDMARCRecord(domain.Name)
		if err != nil {
			log.Println("Domain DMARC Record not found ", domain.Name)
		}
		database.UpdateDMARC(domain.Name, dmarcRecord)
		if StorageErr == nil {
			if dmarcRecord != domain_stored.Dmarc {
				//alert
			}
		}

		spfRecord, err := dnsquery.GetSPFRecord(domain.Name)
		if err != nil {
			log.Println("Domain SPF Record not found ", domain.Name)
		}
		database.UpdateSPF(domain.Name, spfRecord)
		if StorageErr == nil {
			if spfRecord != domain_stored.Spf {
				// Alert
			}
		}

		domainRec, err := database.GetDomainInfo(domain.Name)
		if err != nil {
			log.Println("Error geting info for domain Name:", domain.Name)
		}

		mapOfDates := dnsquery.GetAllDatesFromWhois(domain.Name);
		for _, valor := range mapOfDates {
			fmt.Println("Key Value:", valor);
		}
		for chave, valor := range mapOfDates {
			fmt.Printf("Key %s Value: %s", chave, valor)
		}
		// Whois information
		whois := "";
		if len(mapOfDates) > 0 {
			whois = joinMapByColon(mapOfDates);
			database.UpdateWhois(domain.Name, whois)
		}

		domain := models.DomainInfo{
			Name:        domainRec.Name,
			Registrar:   domainRec.Registrar,
			State:       domainRec.State,
			Tier:        domainRec.Tier,
			TransferTo:  domainRec.TransferTo,
			LastCheck:   time.Now(),
			Dmarc:       dmarcRecord,
			Spf:         spfRecord,
			Nameservers: nsRecordcomma,
			Status:      true,
			Whois:		 whois,
		}
		err_insert := database.InsertDomainHistory(domain)
		if err_insert != nil {
			log.Println("Error trying to insert %v ", err_insert)
		}
	}

}
