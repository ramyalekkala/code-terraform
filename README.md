# 🚀 Terraform Infrastructure for Azure (AKS + Key Vault + More)

This repository contains Terraform code to provision and manage Azure infrastructure using a modular and environment-based approach.

---

## 📂 Repository Structure

```
terraform-code/
│
├── environments/
│   ├── dev/
│   ├── stage/
│   └── prod/
│
├── modules/
│   ├── aks/
│   ├── appservice/
│   ├── database/
│   ├── keyvault/
│   ├── monitoring/
│   ├── networking/
│   ├── rg/
│   ├── storageaccount/
│   └── vm/
│
├── pipeline/
│   ├── dev-pipeline.yaml
│   ├── stage-pipeline.yaml
│   └── prod-pipeline.yaml
```

---

## 🧠 Overview

This project follows:

* ✅ Modular Terraform design
* ✅ Environment-based deployments (Dev, Stage, Prod)
* ✅ Reusable infrastructure components
* ✅ CI/CD pipeline integration using Azure DevOps

---

## ⚙️ Modules Description

| Module         | Description                              |
| -------------- | ---------------------------------------- |
| aks            | Creates Azure Kubernetes Service cluster |
| appservice     | Deploys Azure App Service                |
| database       | Provisions database resources            |
| keyvault       | Creates Azure Key Vault and secrets      |
| monitoring     | Sets up Azure Monitor & Log Analytics    |
| networking     | Configures VNet, Subnets, NSGs           |
| rg             | Creates Resource Groups                  |
| storageaccount | Creates Storage Accounts                 |
| vm             | Deploys Virtual Machines                 |

---

## 🌍 Environments

Each environment contains its own configuration:

* **dev** → Development environment
* **stage** → Pre-production testing
* **prod** → Production environment

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Plan Infrastructure

```bash
terraform plan
```

### 4. Apply Changes

```bash
terraform apply
```

---

## 🔄 CI/CD Pipelines

Pipelines are defined for each environment:

* `dev-pipeline.yaml`
* `stage-pipeline.yaml`
* `prod-pipeline.yaml`

These pipelines:

* Build infrastructure
* Deploy using Terraform
* Maintain environment consistency

---

## 🔐 Best Practices Used

* ✔️ Modular architecture
* ✔️ Environment separation
* ✔️ Reusable components
* ✔️ Secure secrets using Key Vault
* ✔️ Infrastructure as Code (IaC)

---

## 📌 Prerequisites

* Terraform installed
* Azure CLI installed
* Azure Subscription
* Service Principal / Service Connection

---

## 🧩 Future Enhancements

* Add remote backend (Azure Storage for tfstate)
* Implement Terraform Workspaces
* Add automated testing & validation
* Integrate security scanning

---

## 👩‍💻 Author

**Ramya Lekkala**

---

## ⭐ Support

If you find this project useful, consider giving it a ⭐ on GitHub!
