#!/bin/bash

# === Deploy RBAC + Monitoring Lab ===

# Create resource group
az group create \
  --name <resource-group-name> \
  --location <location>

# Create storage account
az storage account create \
  --name <storage-account-name> \
  --resource-group <resource-group-name> \
  --location <location> \
  --sku Standard_LRS

# Create Log Analytics workspace
az monitor log-analytics workspace create \
  --resource-group <resource-group-name> \
  --location <location> \
  --name <log-workspace-name>

# Get resource IDs
STORAGE_ID=$(az storage account show \
  --name <storage-account-name> \
  --resource-group <resource-group-name> \
  --query id -o tsv)

WORKSPACE_ID=$(az monitor log-analytics workspace show \
  --name <log-workspace-name> \
  --resource-group <resource-group-name> \
  --query id -o tsv)

# Enable diagnostic settings (metrics only)
az monitor diagnostic-settings create \
  --name <diagnostic-name> \
  --resource "$STORAGE_ID" \
  --workspace "$WORKSPACE_ID" \
  --metrics '[{"category":"AllMetrics","enabled":true}]'

# Create Entra ID user
az ad user create \
  --display-name "<display-name>" \
  --user-principal-name <user-upn> \
  --password '<temporary-password>' \
  --force-change-password-next-login true

# Assign role to the user
az role assignment create \
  --assignee <user-upn> \
  --role "Storage Blob Data Reader" \
  --scope "$STORAGE_ID"

# Create action group with email
az monitor action-group create \
  --name <action-group-name> \
  --resource-group <resource-group-name> \
  --short-name <short-name> \
  --action email <action-name> <email-address>

# Create alert rule (when any transaction occurs)
az monitor metrics alert create \
  --name <alert-name> \
  --resource-group <resource-group-name> \
  --scopes "$STORAGE_ID" \
  --condition "total Transactions > 0" \
  --description "Alert on storage activity" \
  --action <action-group-name>

# === OPTIONAL COMMANDS (Commented) ===

# List diagnostic categories
# az monitor diagnostic-settings categories list --resource "$STORAGE_ID"

# Show all users
# az ad user list --output table

# Show role assignments
# az role assignment list --assignee <user-upn> --output table

# Delete a role assignment (by ID)
# az role assignment delete --ids <role-assignment-id>

# Delete alert rule
# az monitor metrics alert delete --name <alert-name> --resource-group <resource-group-name>
