#!/bin/bash

# Option 1: Delete just the storage account
# ⚠️ Keeps the resource group, deletes all file shares and data
az storage account delete \
  --name <your-storage-account-name> \
  --resource-group rg-storage-cli \
  --yes

# Option 2: Delete the entire resource group
# 💥 Removes all resources inside, including the storage account
# ⚠️ This is irreversible and stops all billing for that RG
# Uncomment to use:
# az group delete \
#   --name rg-storage-cli \
#   --yes \
#   --no-wait
