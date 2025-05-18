# RBAC + Monitoring Lab (Azure CLI + Entra ID)

This lab demonstrates scoped RBAC, log analytics integration, and basic metric alerting in Azure using only the CLI.

---

## 🔧 What It Covers

- Storage account creation
- Log Analytics workspace + diagnostics
- Role-based access control (RBAC) with Microsoft Entra ID
- Metric-based alerting and action group notifications

---

## 🔐 Access Control

- A test user is created in Microsoft Entra ID
- The user is granted "Storage Blob Data Reader" on the storage account only

---

## 📊 Monitoring

- Storage account metrics are linked to Log Analytics
- Diagnostic logs are unsupported (by design for storage accounts in 2025)
- Metric alert fires when transactions > 0

---

## 🔔 Alerting

- Action group sends an email when triggered
- Alert is scoped to the storage account

---

## 🧼 Teardown

Use `teardown.sh` to remove:
- The test user
- All resource group contents (storage, workspace, alert, etc.)

---

## 📎 Notes

- For storage accounts, only metric categories are supported for diagnostic settings

---

✅ Part of the [Cloud-Labs](https://github.com/ikoviko/Cloud-Labs) learning portfolio.
