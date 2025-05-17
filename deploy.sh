#!/bin/bash

# Create resource group
az group create --name rg-vmcli-lab --location westeurope

# Create virtual network and subnet
az network vnet create \
  --resource-group rg-vmcli-lab \
  --name vnet-cli-lab \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet-cli \
  --subnet-prefix 10.0.0.0/24

# Create network security group and allow SSH
az network nsg create \
  --resource-group rg-vmcli-lab \
  --name nsg-cli-lab

az network nsg rule create \
  --resource-group rg-vmcli-lab \
  --nsg-name nsg-cli-lab \
  --name Allow-SSH \
  --priority 1000 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --destination-port-ranges 22 \
  --source-address-prefixes '*' \
  --destination-address-prefixes '*'

# Create public IP
az network public-ip create \
  --resource-group rg-vmcli-lab \
  --name pip-cli-lab

# Create network interface
az network nic create \
  --resource-group rg-vmcli-lab \
  --name nic-cli-lab \
  --vnet-name vnet-cli-lab \
  --subnet subnet-cli \
  --network-security-group nsg-cli-lab \
  --public-ip-address pip-cli-lab

# Create VM with generated SSH key
az vm create \
  --resource-group rg-vmcli-lab \
  --name vm-cli-lab \
  --nics nic-cli-lab \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username user \
  --generate-ssh-keys

# Enable boot diagnostics
az vm boot-diagnostics enable \
  --resource-group rg-vmcli-lab \
  --name vm-cli-lab

# Install Azure Monitor agent
az vm extension set \
  --publisher Microsoft.Azure.Monitor \
  --name AzureMonitorLinuxAgent \
  --vm-name vm-cli-lab \
  --resource-group rg-vmcli-lab

# ----- Reference CLI Commands for Info -----

# List NSGs in resource group
# az network nsg list --resource-group rg-vmcli-lab --output table

# List VMs and status
# az vm list -d --resource-group rg-vmcli-lab --output table

# Get public IP of VM
# az vm list-ip-addresses --resource-group rg-vmcli-lab --name vm-cli-lab --output table

# Show VM instance view (for status/deallocation check)
# az vm get-instance-view --resource-group rg-vmcli-lab --name vm-cli-lab --output json

