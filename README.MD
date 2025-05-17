# Azure VM Lab (CLI-Only)

This project deploys a fully functional Azure virtual machine using only Azure CLI .

## 🔧 Services Used
- Azure Resource Groups
- Virtual Network + Subnet
- Network Security Group (NSG) with SSH rule
- Public IP + NIC
- Ubuntu VM (Standard_B1s)
- Boot diagnostics
- Azure Monitor Agent

## 📜 Files
- `deploy.sh`: Full deployment script
- `teardown.sh`: Clean-up script to delete all resources

## 💡 Highlights
- Fully terminal-based lab (no Azure Portal)
- Uses SSH keys for authentication
- Monitoring + diagnostics enabled
- Sized for free-tier credits

## ⚠️ Notes
- VM is recomended to be manually deallocated to stop billing. Saves cash

```bash
az vm deallocate \
  --resource-group rg-vmcli-lab \
  --name vm-cli-lab

