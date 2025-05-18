# ☁️ Azure Cloud Projects (Hands-on Learning Labs)

This repository documents my cloud learning journey through **practical Azure labs** — focused on understanding, building, and breaking infrastructure through terminal-based tools like Azure CLI. While the CLI is prioritized to strengthen my scripting skills, the goal is full architectural fluency across both **CLI and Portal** workflows.

Mistakes, wins, and lessons are all shared here — this is a real learning journal.

---

## 👨‍💻 Why I’m Doing This

- 🎯 Learning through **hands-on labs**, not just reading
- 🧠 Documenting everything (including errors) to grow faster
- 🛠️ Preparing for real-world roles in **Cloud Architecture** and **DevOps Engineering**
- 🔄 Eventually expanding into automation, IaC, and multi-cloud strategies

---

## 🧰 Tools Used

- Azure CLI (`az`)
- Bash scripting
- Git + GitHub
- VS Code
- (Future) PowerShell, Bicep, Terraform, GitHub Actions

---

## 📁 Project Structure

Each lab is stored in its own **dedicated GitHub branch**.

| Branch                | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `VM-CLI-LAB`           | Deploy a virtual machine with full networking stack using Azure CLI         |
| `STORAGE-CLI-LAB`      | Create and manage an Azure File Share with soft delete + recovery           |
| `RBAC-MONITORING-LAB`  | Assign roles, monitor resources, and configure alerts using Entra + CLI      |

> Each lab includes a `README.md`, `deploy.sh`, and `teardown.sh` file for clear reuse.

---

## 🧠 Why CLI Focused?

CLI is used primarily because:
- It builds foundational knowledge for **Infrastructure-as-Code**
- It enforces learning how Azure works at the parameter level
- It aligns with the goals of becoming a DevOps-capable engineer

Portal usage is not excluded — but scripting and repeatability are the priority for now.

---

## 🚀 What’s Coming Next?

- 🔐 More RBAC + Identity Labs (custom roles, scoped access)
- 📦 Bicep Lab — deploy infra using Azure-native IaC
- ⚙️ DevOps Labs — pipelines, automation, deployment workflows
- ☁️ Multi-cloud Lab — AWS & GCP equivalents for skill comparison

---

## ✨ How to Use This Repo

- Use the branch selector above to explore each lab
- Clone or fork the repo for hands-on practice
- Read the `README.md` in each lab branch
- Run `deploy.sh` to build, `teardown.sh` to clean up

---

## 📬 Maintained By

**ikoviko** – documenting the journey.

