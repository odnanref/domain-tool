package main

import (
    "testing"
	"time"
	"log"
)

func TestCheckWhois(t *testing.T) {
	now := time.Now().UTC()

    // Format the time as RFC3339 with nanoseconds
    more4 := now.AddDate(0, 0, 36)
	formattedDate := more4.Format(time.RFC3339Nano)

	more42 := now.AddDate(0, 0, 2)
	formattedDate2 := more42.Format(time.RFC3339Nano)


	res := now.AddDate(0,0, 30)
	log.Println("Log Before", res, " Log Day " , more4)
    // Test cases
    tests := []struct {
        dateString string
        want       bool
    }{
        // Date exactly 5 days in the future, should return true
        {"registrar:MarkMonitor Inc., creationDate:2013-01-16T09:36:40Z, expirationDate:2026-01-16T09:36:40Z", false},

        // Date exactly 36 days in the future, should return false
        {"1 creationDate:2016-03-04T11:20:27.124Z, expirationDate:" + formattedDate + ", registrar:GENIOUS COMMUNICATION", true},

		// Date exactly 36 days in the future, should return false
        {"2 creationDate:2016-03-04T11:20:27.124Z, expirationDate:" + formattedDate2 + ", registrar:GENIOUS COMMUNICATION", true},

        // Date 3 days in the future, should return false
        {"registrar:MarkMonitor Inc., creationDate:2013-01-16T09:36:40Z, expirationDate:2026-01-16T09:36:40Z", false},

        // Date in the past, should return false
		{"creationDate:2016-03-04T11:20:27.124Z, expirationDate:2024-08-04T11:20:27.206Z, registrar:GENIOUS COMMUNICATION", false},

        // Date far in the future, should return true
		{"registrar:MarkMonitor Inc., creationDate:2013-01-16T09:36:40Z, expirationDate:2026-01-16T09:36:40Z", false},
    }
	
	log.Println("Tests should pass if the Data is bigger than 30 days and less than 30 days from now.")
    for _, tt := range tests {
        got:= checkWhoisIsExpiring(tt.dateString)
        if got != tt.want {
            t.Errorf("CheckWhois(%v) = %v; want %v", tt.dateString, got, tt.want)
        }
    }
}
