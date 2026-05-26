#!/bin/bash

# AZ-104 Networking Lab
# Resource Group: rg-test-centalus

# Step 1 - Create VNet-A
az network vnet create \
  --name VNet-A \
  --resource-group rg-test-centalus \
  --location centralus \
  --address-prefix 10.0.0.0/16 \
  --subnet-name Subnet-A \
  --subnet-prefix 10.0.1.0/24

# Step 2 - Create VNet-B
az network vnet create \
  --name VNet-B \
  --resource-group rg-test-centalus \
  --location centralus \
  --address-prefix 10.1.0.0/16 \
  --subnet-name Subnet-B \
  --subnet-prefix 10.1.1.0/24

# Step 3 - Create NSG
az network nsg create \
  --name NSG-A \
  --resource-group rg-test-centalus \
  --location centralus

# Step 4 - Add NSG Rules
az network nsg rule create \
  --nsg-name NSG-A \
  --resource-group rg-test-centalus \
  --name Allow-RDP \
  --priority 100 \
  --destination-port-ranges 3389 \
  --access Allow \
  --protocol Tcp

az network nsg rule create \
  --nsg-name NSG-A \
  --resource-group rg-test-centalus \
  --name Allow-HTTP \
  --priority 200 \
  --destination-port-ranges 80 \
  --access Allow \
  --protocol Tcp

# Step 5 - Attach NSG to Subnet-A
az network vnet subnet update \
  --name Subnet-A \
  --vnet-name VNet-A \
  --resource-group rg-test-centalus \
  --network-security-group NSG-A

# Step 6 - Create VNet Peering
az network vnet peering create \
  --name VNetA-to-VNetB \
  --resource-group rg-test-centalus \
  --vnet-name VNet-A \
  --remote-vnet VNet-B \
  --allow-vnet-access

az network vnet peering create \
  --name VNetB-to-VNetA \
  --resource-group rg-test-centalus \
  --vnet-name VNet-B \
  --remote-vnet VNet-A \
  --allow-vnet-access

# Step 7 - Create Public IP
az network public-ip create \
  --name LB-PublicIP \
  --resource-group rg-test-centalus \
  --location centralus \
  --sku Standard

# Step 8 - Create Load Balancer
az network lb create \
  --name LB-az104 \
  --resource-group rg-test-centalus \
  --location centralus \
  --sku Standard \
  --public-ip-address LB-PublicIP \
  --frontend-ip-name FrontendIP \
  --backend-pool-name BackendPool

# Step 9 - Create Health Probe
az network lb probe create \
  --resource-group rg-test-centalus \
  --lb-name LB-az104 \
  --name HealthProbe \
  --protocol Tcp \
  --port 80

# Step 10 - Create Load Balancing Rule
az network lb rule create \
  --resource-group rg-test-centalus \
  --lb-name LB-az104 \
  --name LBRule \
  --protocol Tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name FrontendIP \
  --backend-pool-name BackendPool \
  --probe-name HealthProbe
