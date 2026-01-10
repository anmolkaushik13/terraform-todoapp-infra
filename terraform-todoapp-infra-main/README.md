# 🏗️ Azure Cloud-Native Infrastructure (AKS + SQL)

This repository contains the Infrastructure as Code (IaC) to deploy a scalable, containerized application environment on Azure using Terraform.

It features a modern architecture utilizing **Azure Kubernetes Service (AKS)** for compute and **Azure SQL** for persistence, managed via a modular Terraform structure and GitHub Actions CI/CD.

## 🚀 Key Features
* **Multi-Environment Support:** distinct configurations for `dev` (Development) and `prod` (Production) environments.
* **Container-First Design:** Includes modules for ACR (Registry) and AKS (Cluster).
* **Managed Identity:** Uses Azure Managed Identities for secure, password-less authentication between resources.
* **Secure Secrets:** Key Vault integration for managing sensitive data.

## 📂 Repository Structure

```
Root/
├── .github/workflows/          # CI/CD Pipelines
│   └── main.yml                # Unified pipeline for Plan/Apply
│
├── environments/               # Environment Entry Points
│   ├── dev/                    # Development State & Variables
│   └── prod/                   # Production State & Variables
│
├── modules/                    # Reusable Terraform Components
│   ├── azurerm_container_registry
│   ├── azurerm_kubernetes_cluster
│   ├── azurerm_sql_database
│   ├── azurerm_sql_server
│   ├── azurerm_key_vault
│   ├── azurerm_managed_identity
│   ├── azurerm_public_ip
│   └── azurerm_resource_group

```

🛠️ Technology Stack
  Compute: Azure Kubernetes Service (AKS)
  Images: Azure Container Registry (ACR)
  Database: Azure SQL Database (PaaS)
  Security: Key Vault & Managed Identities

🚦 Getting Started
  Select Environment: Navigate to environments/dev or environments/prod.
  Initialize: terraform init
  Plan: terraform plan
  Apply: terraform apply

👨‍💻 Author
  **Anmol Sharma**  
🔗 [LinkedIn](https://www.linkedin.com/in/anmol-sharma-7b3506246/)
