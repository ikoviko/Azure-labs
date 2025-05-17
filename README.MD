 # Cloud-Projects
# ☁️ Azure Cloud Projects (CLI-Focused Labs)

This repository documents my **cloud learning journey** through hands-on labs using Azure CLI. Every project here is created, deployed, tested, and (sometimes broken 😅) entirely via terminal — with no GUI shortcuts. Mistakes, lessons, and fixes are part of the process and shared openly.

---

## 👨‍💻 Why I’m Doing This

- 🎯 I'm learning by doing — no passive theory here
- 🧠 I document both wins and errors to grow faster and help others
- 📈 The end goal is to grow into **Cloud Architect** or **DevOps Engineer**
- 🔧 This will eventually include **DevOps-focused labs** as well (CI/CD, automation, pipelines)

---

## 🔧 Tools Used

- **Azure CLI** (`az`)
- **Bash scripting**
- **VS Code**
- **Git + GitHub**
- Optional: PowerShell, Bicep, Terraform (future labs)

---

## 📁 Project Structure

Each lab is stored in its own GitHub **branch** inside the [`Azure-labs`](https://github.com/ikoviko/Azure-labs) repository:

| Lab Branch         | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| [`VM-CLI-LAB`](https://github.com/ikoviko/Azure-labs/tree/VM-CLI-LAB)        | Build a virtual machine and full networking stack from scratch using Azure CLI |
| [`STORAGE-CLI-LAB`](https://github.com/ikoviko/Azure-labs/tree/STORAGE-CLI-LAB) | Create and manage an Azure File Share with soft delete + restore via CLI       |

---

## 🚀 Why CLI?

- 💻 Learn infrastructure as code fundamentals *before* jumping to tools like Bicep or Terraform
- 🧠 Reinforce what’s happening under the hood (you control every parameter)
- 🛠️ Prepare for certs like **AZ-104** and **AZ-305**
- 🎯 Show real-world engineering capability, not just point-and-click

---

## 🧠 Coming Soon

- 🔐 **RBAC Lab** — create and assign custom roles via CLI
- 📦 **Bicep Lab** — deploy the same infra using Infrastructure-as-Code
- ⚙️ **DevOps Labs** — CI/CD pipelines, YAML-based workflows, monitoring
- ☁️ **Multi-cloud folder** — AWS and GCP scripts to compare service design

---

## ✨ How to Use This Repo

1. Browse each lab branch via the GitHub branch selector
2. Clone the repo or copy the scripts into your terminal
3. Follow the `README.md` and `deploy.sh` inside each project
4. Use `teardown.sh` to clean up and avoid costs
5. Fork the repo to use as your own cloud lab journal

---

## 📬 Contact

Created and maintained by **ikoviko**
