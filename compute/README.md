# Lab 02 — Virtual Machine Deployment

## What I Did
- Deployed VM via Azure Portal
- Deployed same VM using Azure CLI
- Exported and saved ARM template

## CLI Commands Used
az vm create \
  --name myVM \
  --resource-group myRG \
  --image Win2019Datacenter \
  --admin-username azureuser

## What I Learned
- Portal vs CLI deployment difference
- ARM template structure
- VM sizes and disk options

## AZ-104 Exam Topic
- Deploy and manage Azure compute resources
