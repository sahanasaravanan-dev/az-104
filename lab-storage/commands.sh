#!/bin/bash

# AZ-104 Storage Lab
# Resource Group: rg-test-centalus

# Step 1 - Create Storage Account
az storage account create \
  --name sahanaaz104storage \
  --resource-group rg-test-centalus \
  --location centralus \
  --sku Standard_LRS \
  --kind StorageV2 \
  --access-tier Hot

# Step 2 - Create Blob Container
az storage container create \
  --name mycontainer \
  --account-name sahanaaz104storage \
  --public-access off

# Step 3 - Upload a File
echo "Hello AZ-104 Storage Lab" > test.txt

az storage blob upload \
  --container-name mycontainer \
  --account-name sahanaaz104s


  se=2026-12-31&sp=r&sv=2026-04-06&sr=b&sig=ugE%2BTYH3ud1m%2BZ%2FxAzD5EVF5%2FITyUqn3nVClBMl7Zeo%3D