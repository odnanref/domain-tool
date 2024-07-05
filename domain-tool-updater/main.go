// updater.go
package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"time"

	"domain-tool-updater/dnsquery"

	_ "github.com/lib/pq"
)

// DomainInfo represents the structure you provided
type DomainInfo struct {
	Name        string
	Registrar   string
	State       string
	Tier        string
	TransferTo  string
	LastCheck   time.Time
	Spf         string
	Dmarc       string
	Nameservers string
	Status      string
}

var db *sql.DB

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
		&domain.Status,
	)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, fmt.Errorf("no domain found with name: %s", domainName)
		}
		return nil, err
	}

	return &domain, nil
}

func getDomainInfoAll(db *sql.DB) ([]DomainInfo, error) {
	query := "SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers, status FROM domain_info WHERE status = 1"
	rows, err := db.Query(query)

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
			&domain.Status,
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

func updateSPF(db *sql.DB, domainName string, spfRecord string) error {
	query := "UPDATE domain_info SET spf = $1, last_check=NOW() WHERE name = $2"
	_, err := db.Exec(query, spfRecord, domainName)
	return err
}

func updateDMARC(db *sql.DB, domainName string, DmarcRecord string) error {
	query := "UPDATE domain_info SET dmarc = $1, last_check=NOW() WHERE name = $2"
	_, err := db.Exec(query, DmarcRecord, domainName)
	return err
}

func updateNS(db *sql.DB, domainName string, nsRecord string) error {
	query := "UPDATE domain_info SET nameservers = $1, last_check=NOW() WHERE name = $2"
	_, err := db.Exec(query, nsRecord, domainName)
	return err
}

func insertDomainHistory(domain DomainInfo) error {
	_, err := db.Exec("INSERT INTO domain_info_history (name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9,1)",
		domain.Name, domain.Registrar, domain.State, domain.Tier, domain.TransferTo, domain.LastCheck, domain.Spf, domain.Dmarc, domain.Nameservers)
	return err
}

func main() {
	fmt.Println("Started Updater...")

	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbHost := os.Getenv("DB_HOST")
	dbName := os.Getenv("DB_NAME")

	dsn := fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable",
		dbUser, dbPassword, dbHost, dbName)

	var err error
	db, err = sql.Open("postgres", dsn)

	if err != nil {
		panic(err)
	}
	defer db.Close()

	domains, err := getDomainInfoAll(db)
	if err != nil {
		log.Printf("ERROR: Rows iteration error: %v", err)
		panic("ERROR Getting all domains")
	}

	for _, domain := range domains {
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
		updateNS(db, domain.Name, nsRecordcomma)

		dmarcRecord, err := dnsquery.GetDMARCRecord(domain.Name)
		if err != nil {
			log.Println("Domain DMARC Record not found ", domain.Name)
		}
		updateDMARC(db, domain.Name, dmarcRecord)

		spfRecord, err := dnsquery.GetSPFRecord(domain.Name)
		if err != nil {
			log.Println("Domain SPF Record not found ", domain.Name)
		}
		updateSPF(db, domain.Name, spfRecord)

		domainRec, err := getDomainInfo(db, domain.Name)
		if err != nil {
			log.Println("Error geting info for domain Name:", domain.Name)
		}
		domain := DomainInfo{
			Name:        domainRec.Name,
			Registrar:   domainRec.Registrar,
			State:       domainRec.State,
			Tier:        domainRec.Tier,
			TransferTo:  domainRec.TransferTo,
			LastCheck:   time.Now(),
			Dmarc:       dmarcRecord,
			Spf:         spfRecord,
			Nameservers: nsRecordcomma,
		}
		err_insert := insertDomainHistory(domain)
		if err_insert != nil {
			log.Println("Error trying to insert %v ", err_insert)
		}
	}

}
