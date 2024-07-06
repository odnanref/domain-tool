package database

import (
	"database/sql"
	"domaintool/models"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

var db *sql.DB

// Initialize initializes the database connection
func Initialize(dataSourceName string) {
	var err error
	db, err = sql.Open("postgres", dataSourceName)
	if err != nil {
		log.Fatal(err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}
	log.Println("Database connected successfully!")
}

// Close closes the database connection
func Close() {
	if db != nil {
		db.Close()
	}
}

// GetDomainInfo queries the domain information by name
func GetDomainInfo(domainName string) (*models.DomainInfo, error) {
	query := "SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers, status FROM domain_info WHERE name = $1"
	var domain models.DomainInfo
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

func GetDomainInfoHistoryAllByDomain(domainName string) ([]models.DomainInfo, error) {
	query := "SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers, status FROM domain_info_history WHERE name = $1 "
	rows, err := db.Query(query, domainName)

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	var domains []models.DomainInfo
	for rows.Next() {
		var domain models.DomainInfo
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

// List Domains
func GetAll() ([]models.DomainInfo, error) {
	rows, err := db.Query("SELECT name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers, status FROM domain_info")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var domains []models.DomainInfo
	for rows.Next() {
		var domain models.DomainInfo
		err := rows.Scan(&domain.Name, &domain.Registrar, &domain.State, &domain.Tier, &domain.TransferTo, &domain.LastCheck, &domain.Spf, &domain.Dmarc, &domain.Nameservers, &domain.Status)
		if err != nil {
			return nil, err
		}
		domains = append(domains, domain)
	}

	return domains, nil
}

// Insert a new Domain to be queried
func InsertDomainInfo(domain models.DomainInfo) error {
	_, err := db.Exec("INSERT INTO domain_info (name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers,status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
		domain.Name, domain.Registrar, domain.State, domain.Tier, domain.TransferTo, domain.LastCheck, domain.Spf, domain.Dmarc, domain.Nameservers, domain.Status)
	return err
}

// Update DB By DomainInfo
func UpdateDomainInfo(domain models.DomainInfo) error {
	_, err := db.Exec("UPDATE domain_info SET registrar=$2, state=$3, tier=$4, transfer_to=$5, last_check=NOW(), spf=$6, dmarc=$7, nameservers=$8,status=$9 WHERE name=$1",
		domain.Name, domain.Registrar, domain.State, domain.Tier, domain.TransferTo, domain.Spf, domain.Dmarc, domain.Nameservers, domain.Status)
	return err
}
