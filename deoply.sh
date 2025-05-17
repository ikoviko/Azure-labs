#!/bin/bash

# Create resource group (if not use existing)
az group create --name rg-storage-cli --location westeurope

# Create storage account (must be globally unique)
az storage account create \
  --name uniquename \
  --resource-group rg-storage-cli \
  --location westeurope \   #change the location if needed
  --sku Standard_LRS \
  --https-only true

# Pause and prompt for manual input of storage account name
echo ">> Enter your storage account name (used above):"
read STORAGE_NAME

# Enable soft delete for file shares
az storage account file-service-properties update \
  --account-name $STORAGE_NAME \
  --enable-delete-retention true \
  --delete-retention-days 6  #if you choose not the set it manually you can skip this line default retention is 7 days

# Retrieve the account key (used to authenticate later commands)
ACCOUNT_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group rg-storage-cli \
  --query "[0].value" -o tsv)

# Create a file share
az storage share create \
  --name clilab-share \
  --account-name $STORAGE_NAME \
  --account-key $ACCOUNT_KEY

# Create a test file locally
echo "Hello from Azure CLI Lab" > test-upload.txt

# Upload the file to the Azure File Share
az storage file upload \
  --share-name clilab-share \
  --source test-upload.txt \
  --account-name $STORAGE_NAME \
  --account-key $ACCOUNT_KEY

# Delete the file share
az storage share delete \
  --name $SHARE_NAME \
  --account-name $STORAGE_NAME \
  --account-key $ACCOUNT_KEY

# Wait for deletion to propagate
echo "Waiting for deletion to propagate..."
sleep 30  #sleep 30 command is included to allow time for the deletion to propagate before attempting to list and restore the deleted share. Adjust the sleep duration as needed.
 
# List deleted shares to find the deletedShareVersion
DELETED_VERSION=$(az storage share-rm list \
  --resource-group $RESOURCE_GROUP \
  --storage-account $STORAGE_NAME \
  --include-deleted \
  --query "[?name=='$SHARE_NAME'].deletedShareVersion" -o tsv)

# Restore the deleted file share
az storage share-rm restore \
  --name $SHARE_NAME \
  --deleted-version $DELETED_VERSION \
  --resource-group $RESOURCE_GROUP \
  --storage-account $STORAGE_NAME

