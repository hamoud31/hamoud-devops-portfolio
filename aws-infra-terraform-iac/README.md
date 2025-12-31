# 🚀 AWS EKS Cluster with Terraform

A fully automated, production‑grade Amazon EKS deployment built with Terraform.  
This project demonstrates modern Infrastructure‑as‑Code practices, modular design, and cloud‑native architecture — ideal for portfolio presentation or real‑world Kubernetes environments.

## 🎯 Project Purpose

This project provisions a highly available EKS cluster in the **eu-west-3 (Paris)** region using Terraform. It highlights:

- Infrastructure-as-Code best practices  
- Modular Terraform architecture  
- Secure, scalable Kubernetes design  
- Multi‑AZ high availability  
- Cloud‑native networking and IAM integration  

The goal is to provide a **reproducible, environment‑configurable blueprint** for deploying containerized workloads on AWS using modern DevOps workflows.

## 🧩 Features

- **Modular Terraform structure**  
  - `vpc` module → VPC, subnets, IGW, NAT Gateways  
  - `eks` module → EKS control plane, node groups, IAM roles  
- **Multi‑AZ deployment** for high availability  
- **Public/private subnet architecture** with NAT Gateways  
- **Remote state backend** (S3 + DynamoDB locking)  
- **IAM roles** integrated directly into the EKS module  
- **Simple validation workflow** using kubectl  
- **Clean and safe teardown** with `terraform destroy`


## 🗺️ Deployment Architecture Overview

The EKS cluster spans **three Availability Zones** in eu-west-3 for resilience and scalability.

### Architecture Components

- **VPC** with public and private subnets in each AZ  
- **Internet Gateway** for outbound connectivity  
- **NAT Gateways** in public subnets for private subnet egress  
- **Amazon EKS control plane** distributed across AZs  
- **Managed node groups** running in private subnets  
- **IAM roles & policies** for EKS control plane and worker nodes  

This architecture follows AWS best practices for secure, production‑ready Kubernetes clusters.


## 📁 Project Structure

```
.
├── main.tf               # Root module
├── variables.tf          # Input variables
│
├── backend/              # Remote state (S3 + DynamoDB)
│   ├── backend.tf
│   └── variables.tf
│
└── modules/              # Reusable Terraform modules
    ├── vpc/
    └── eks/
```


## ⚙️ Prerequisites

Before deploying, ensure you have:

- **Terraform ≥ 1.0**
- **AWS CLI** configured with credentials + default region
- **kubectl** installed
- IAM permissions for:
  - VPC  
  - EC2  
  - EKS  
  - IAM  
  - S3  
  - DynamoDB  

---

## 🚀 Quick Start

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Plan the deployment

```bash
terraform plan -out plan.tfplan
```

### 3️⃣ Apply the plan

```bash
terraform apply "plan.tfplan"
```

### 4️⃣ Configure kubeconfig

```bash
aws eks update-kubeconfig --region eu-west-3 --name demo-eks-cluster
```

### 5️⃣ Validate the cluster

```bash
kubectl config get-contexts
kubectl get nodes
kubectl get pods --all-namespaces
```

### 6️⃣ Clean up resources

```bash
terraform destroy
```

---

## 📌 Notes

- This project is designed for **learning, demos, and portfolio use**, but follows production‑grade patterns.  
- You can easily extend it with:
  - Ingress controllers  
  - Add‑ons (Cluster Autoscaler, Metrics Server, etc.)  
  - GitOps workflows  
  - Additional node groups  

---
