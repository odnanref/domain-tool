# 🌐 Domain Tool

**Domain Tool** is a web-based application designed to monitor and manage domain information efficiently.  
It helps track changes in your domains and provides timely notifications for important updates.

---

## 🧩 Overview

Domain Tool consists of:
- A **web application** (frontend and backend) powered by **PostgreSQL** for data storage.
- A backend service called **`domain-tool-updater`**, responsible for fetching and updating domain information periodically.

This system ensures that domain owners and administrators stay informed about any changes in domain configurations.

---

## ⚙️ Features

- 🔍 **Domain Monitoring** — Watch domains you own or follow.  
- 📬 **Notifications** — Receive alerts when changes occur.  
- 🧠 **Automated Updates** — The `domain-tool-updater` service periodically refreshes domain data.  
- 🧾 **Configuration Tracking** — Detects modifications in:
  - **SPF records**
  - **DMARC policies**
  - **Nameservers**
  - **WHOIS / Domain metadata**

---

## 🏗️ Architecture

┌────────────────┐ ┌──────────────────────┐
│ Web Frontend │ <----> │ Application API │
└────────────────┘ └─────────┬────────────┘
│
▼
┌──────────────────────┐
│ PostgreSQL Database │
└──────────────────────┘
│
▼
┌──────────────────────┐
│ domain-tool-updater │
│ (background service) │
└──────────────────────┘



# Basic domain tool (version 1)

## Summary

Domain Tool is a DNS Fetch and analyse information regarding one or more domains, keeping the history of the checks made.

### Current Features
- Display information regarding domains.
- Add / Remove / Edit Domains
- Get information about each domain SPF , DMARC , Whois Records.

### Roadmap
- Event Alert based on domain changes.
- Alert on Expire information


## Build
1. Initially started using AI chatgpt to build the CRUD and am working on improving it.
2. Also using this to test GITHUB Actions


