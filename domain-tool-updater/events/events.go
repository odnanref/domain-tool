package events

import (
	"domain-tool-updater/models"
	time
)

type EventType string

const (
	EventTypeDmarc EventType = "UPDATE_DMARC"
	EventTypeSpf EventType = "UPDATE_SPF"
	EventTypeNameservers EventType = "UPDATE_NAMESERVERS"
)

type EventAction string

const (
	EventActionChange EventType = "ACTION_CHANGE"
	EventActionInsert EventType = "ACTION_INSERT"
)

type Event struct {
	EventType EventType
	EventAction EventAction
	ExecuteTime time.Now()
	DomainInfo models.DomainInfo
}

func (e Event) GetEventType() int {
	return e.EventType
}

func (e Event) GetDomainInfo() models.DomainInfo {
	return e.DomainInfo
}

func (e Event) GetEventAction() int {
	return e.EventAction
}