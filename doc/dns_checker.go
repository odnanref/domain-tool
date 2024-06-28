package main

import (
	"fmt"
	"log"
	"strings"
	"net"

	"github.com/miekg/dns"
)

// DNSQuery performs a DNS query for a given domain and record type.
func DNSQuery(domain string, qtype uint16) ([]dns.RR, error) {
	client := new(dns.Client)
	msg := new(dns.Msg)
	msg.SetQuestion(dns.Fqdn(domain), qtype)
	msg.RecursionDesired = true
	msg.AuthenticatedData = true // Set the AD bit

	response, _, err := client.Exchange(msg, "1.1.1.1:53") // Using Google's public DNS server
	if err != nil {
		return nil, err
	}
	
	if response.Rcode != dns.RcodeSuccess {
		return nil, fmt.Errorf("invalid answer name %s after MX query for %s", domain, domain)
	}
	return response.Answer, nil
}

func GetTXTRecords(domain string) ([]string, error) {
	records, err := net.LookupTXT(domain)
	if err != nil {
		return nil, err
	}
	return records, nil
}

// GetTXTRecords fetches TXT records for a domain.
func GetTXTRecords_b1(domain string) ([]string, error) {
	records, err := DNSQuery(domain, dns.TypeTXT)
	if err != nil {
		return nil, err
	}

	var txtRecords []string
	for _, record := range records {
		if txt, ok := record.(*dns.TXT); ok {
			txtRecords = append(txtRecords, strings.Join(txt.Txt, " "))
		}
	}
	return txtRecords, nil
}

// GetNSRecords fetches NS records for a domain.
func GetNSRecords(domain string) ([]string, error) {
	records, err := DNSQuery(domain, dns.TypeNS)
	if err != nil {
		return nil, err
	}

	var nsRecords []string
	for _, record := range records {
		if ns, ok := record.(*dns.NS); ok {
			nsRecords = append(nsRecords, ns.Ns)
		}
	}
	return nsRecords, nil
}

// GetDMARCRecord fetches the DMARC record for a domain.
func GetDMARCRecord(domain string) (string, error) {
	dmarcDomain := "_dmarc." + domain
	records, err := GetTXTRecords(dmarcDomain)
	if err != nil {
		return "", err
	}

	for _, record := range records {
		if strings.HasPrefix(record, "v=DMARC1") {
			return record, nil
		}
	}
	return "", fmt.Errorf("no DMARC record found for %s", domain)
}

// GetSPFRecord fetches the SPF record for a domain.
func GetSPFRecord(domain string) (string, error) {
	records, err := GetTXTRecords(domain)
	if err != nil {
		return "", err
	}

	for _, record := range records {
		if strings.HasPrefix(record, "v=spf1") {
			return record, nil
		}
	}
	return "", fmt.Errorf("no SPF record found for %s", domain)
}

// GetDKIMRecord fetches the DKIM record for a domain.
func GetDKIMRecord(domain, selector string) (string, error) {
	dkimDomain := selector + "._domainkey." + domain
	records, err := GetTXTRecords(dkimDomain)
	if err != nil {
		return "", err
	}

	for _, record := range records {
		if strings.HasPrefix(record, "v=DKIM1") {
			return record, nil
		}
	}
	return "", fmt.Errorf("no DKIM record found for %s with selector %s", domain, selector)
}

func GetDomainDetails(domain string, dkim_selector []string) {
	
	txtRecords, err := GetTXTRecords(domain)
	if err != nil {
		log.Fatalf("Failed to get TXT records: %v", err)
	}
	for _, txt := range txtRecords {
		fmt.Println("txt=%s", txt)
	}
	fmt.Printf("TXT records for %s:\n%v\n\n", domain, txtRecords)

	nsRecords, err := GetNSRecords(domain)
	if err != nil {
		log.Fatalf("Failed to get NS records: %v", err)
	}
	fmt.Printf("NS records for %s:\n%v\n\n", domain, nsRecords)

	dmarcRecord, err := GetDMARCRecord(domain)
	if err != nil {
		log.Printf("Failed to get DMARC record: %v", err)
	} else {
		fmt.Printf("DMARC record for %s:\n%s\n\n", domain, dmarcRecord)
	}

	spfRecord, err := GetSPFRecord(domain)
	if err != nil {
		log.Printf("Failed to get SPF record: %v", err)
	} else {
		fmt.Printf("SPF record for %s:\n%s\n\n", domain, spfRecord)
	}

	for _, selector := range dkim_selector {
		dkimRecord, err := GetDKIMRecord(domain, selector)
		if err != nil {
			log.Printf("Failed to get DKIM record: %v", err)
		} else {
			fmt.Printf("DKIM record for %s (selector %s):\n%s\n\n", domain, selector, dkimRecord)
		}
	}
}

func main() {
	GetDomainDetails("sapo.pt", []string{"google"})
}
