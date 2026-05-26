# Lab 04 — Storage

## What I Built
- Storage Account (Standard LRS, Hot tier)
- Blob Container (private access)
- Uploaded file to container
- Generated SAS Token (read only, expires 2026-12-31)
- Lifecycle Policy:
  - 30 days → move to Cool
  - 90 days → move to Archive
  - 365 days → delete
- Storage Firewall enabled (deny all, allow Azure services)

## Resource Group
rg-test-centalus (Central US)

## Key Concepts Learned
- Blob types: Block, Append, Page
- Access tiers: Hot, Cool, Archive
- SAS Token = temporary limited access
- Lifecycle policy = auto move between tiers
- Storage firewall = deny public access

## AZ-104 Exam Topics Covered
- Implement and manage storage (15-20%)