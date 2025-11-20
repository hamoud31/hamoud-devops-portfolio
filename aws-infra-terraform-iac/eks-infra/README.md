# 🚀 AWS EKS Cluster Setup with Terraform

This project provisions an **Amazon Elastic Kubernetes Service (EKS)** cluster using **Terraform Infrastructure as Code (IaC)**.  
It provides a **reproducible, modular, and scalable** way to deploy Kubernetes on AWS following best practices.

---
## 
# 📦 Terraform Backend Setup (S3 + DynamoDB)

This folder contains Terraform code to provision the **remote backend** for storing Terraform state securely.  
It sets up an **Amazon S3 bucket** and a **DynamoDB table** to enable state storage and locking when provisioning the EKS cluster.

---

## 🛠️ Resources Created

- **S3 Bucket** → Stores the Terraform state file (`terraform.tfstate`)
- **DynamoDB Table** → Provides state locking to prevent concurrent modifications

---

## 🚀 Usage

1. Navigate to the backend folder:
   ```bash
   cd backend
   terraform init
   terraform apply -auto-approve


## 📁 Project Structure

* **`main.tf`** → Entry point for Terraform resources  
* **`variables.tf`** → Input variables (region, cluster name, node groups, etc.)  
* **`providers.tf`** → Provider configuration (AWS, Kubernetes)  
* **`backend.tf`** → Remote state backend configuration (S3 + DynamoDB recommended)  
* **`modules/`** → Reusable Terraform modules:
  * VPC  
  * EKS Cluster  
  * Node Groups  
  * IAM roles & OIDC  
* **`outputs.tf`** → Outputs such as cluster endpoint, kubeconfig, and node group info  
* **`README.md`** → Documentation (this file)  

---
## AWS EKS Architecture Diagram
![EKS Architecture](docs/eks-architecture.png)

## ⚡ Quick Start

### 1. Initialize and Deploy
```bash
terraform init
terraform plan
terraform apply -auto-approve

### 1. Configure kubectl

aws eks update-kubeconfig --name YOUR_CLUSTER_NAME --region YOUR_REGION

Test access:
kubectl get nodes


### 1. Cleanup
terraform destroy
