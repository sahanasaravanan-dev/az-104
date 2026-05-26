# Lab 03 — Networking

## What I Built
- VNet-A (10.0.0.0/16) with Subnet-A
- VNet-B (10.1.0.0/16) with Subnet-B
- NSG with RDP and HTTP rules
- NSG attached to Subnet-A
- VNet Peering A ↔ B (Connected ✅)
- Load Balancer with Health Probe and LB Rule

## Resource Group
rg-test-centalus (Central US)

## Key Concepts Learned
- VNet Peering is NOT transitive
- NSG priority — lower number runs first
- Load Balancer needs health probe before rules

## AZ-104 Exam Topics Covered
- Implement and manage virtual networking (20-25%)
