# Azure Storage CLI Lab

This lab demonstrates how to create and manage an Azure File Share using only Azure CLI. It includes enabling soft delete, uploading a test file, deleting the share, and restoring it — all from the terminal.

---

## 🚀 What This Project Covers

- Creating a storage account (Standard_LRS, HTTPS only)
- Enabling soft delete for file shares (retention policy: 6 days)
- Creating a file share and uploading a test file
- Deleting the file share
- Restoring the deleted share using Azure CLI (2025 support)
- Optionally deleting the storage account or full resource group

---

## 📁 Files

- `deploy.sh` – Full CLI workflow: create, upload, delete, restore
- `teardown.sh` – Clean-up script to delete the storage account or resource group
- `test-upload.txt` – Auto-generated test file

---

## ⚠️ Important Notes

- **Soft delete must be enabled** before deletion to allow recovery
- A short delay (~30 sec) after deletion may be required before restore works
- Replace all placeholder values (like `<your-storage-account-name>`) if running manually

---

## 🔐 Key Commands

```bash
# Get storage account key
az storage account keys list \
  --account-name <name> \
  --resource-group rg-storage-cli \
  --query "[0].value" \
  --output tsv

# Upload a file
az storage file upload \
  --share-name clilab-share \
  --source test-upload.txt \
  --account-name <name> \
  --account-key <key>

# Delete file share
az storage share delete \
  --name clilab-share \
  --account-name <name> \
  --account-key <key>

# List deleted shares and find the deleted version
az storage share-rm list \
  --resource-group rg-storage-cli \
  --storage-account <name> \
  --include-deleted

# Restore deleted file share
az storage share-rm restore \
  --name clilab-share \
  --deleted-version <deletedShareVersion> \
  --resource-group rg-storage-cli \
  --storage-account <name>
