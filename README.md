# 🌐 DNS Infrastructure as Code with Terraform

This repository manages DNS records using **Terraform** and **Cloudflare**, backed by **AWS S3** for remote state and **DynamoDB** for state locking. It's designed to be used as a template for setting up DNS zones in a scalable, automated, and secure way using GitHub Actions.

---

## 🚀 What This Repo Does

- Creates and manages A and CNAME DNS records via Cloudflare
- Uses S3 as the remote backend for storing Terraform state
- Uses DynamoDB for state locking to avoid concurrency issues
- Automates deployment via GitHub Actions on each push to the `main` branch

---

## 📦 Prerequisites

Before you begin, ensure you have:

- An [AWS account](https://aws.amazon.com/) with permission to:
    - Create and manage an S3 bucket
    - Create and manage a DynamoDB table
- A [Cloudflare account](https://cloudflare.com) and:
    - An API token with DNS edit permissions
    - The Zone ID for your domain
- Terraform v1.5.0 or later (if testing locally)

---

## 🔐 Required GitHub Secrets

To allow GitHub Actions to deploy your infrastructure, set the following **repository secrets**:

| Secret Name               | Description                                               |
|---------------------------|-----------------------------------------------------------|
| `AWS_ACCESS_KEY_ID`       | AWS access key for IAM user                              |
| `AWS_SECRET_ACCESS_KEY`   | AWS secret access key for IAM user                       |
| `AWS_REGION`              | AWS region (e.g. `eu-central-1`)                         |
| `TF_BACKEND_BUCKET`       | S3 bucket name for storing Terraform state               |
| `TF_BACKEND_DDB_TABLE`    | DynamoDB table name for state locking                    |
| `CLOUDFLARE_API_TOKEN`    | Cloudflare API token with DNS zone permissions           |
| `CLOUDFLARE_ZONE_ID`      | Cloudflare Zone ID for your domain                       |

You can set these in your GitHub repository under:  
**Settings → Secrets and variables → Actions → New repository secret**

---

## 📁 Project Structure

```bash
.
├── cloudflare.tf              # Cloudflare DNS records
├── providers.tf               # Terraform provider configuration (AWS & Cloudflare)
├── variables.tf               # Input variables (API token, region, zone ID)
├── .github/
│   └── workflows/
│       └── terraform-dns.yml  # GitHub Actions workflow to deploy on push
│       └── setup-backend.yml  # Github Actions workflow to setup the terraform backend
├── README.md                  # You're reading it!
