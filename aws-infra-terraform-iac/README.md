🚀 AWS EKS Cluster with Terraform
  
  🎯 Project Purpose

This project demonstrates how to provision a highly available, production-grade Amazon EKS cluster using Terraform. It’s designed as a portfolio showcase to highlight infrastructure-as-code skills, modular design patterns, and cloud-native architecture principles. The deployment spans multiple Availability Zones in the eu-west-3 (Paris) region, using public and private subnets, NAT gateways, and IAM roles to create a secure and scalable Kubernetes environment. The goal is to provide a reproducible, environment-configurable blueprint for deploying containerized workloads on AWS using modern DevOps practices.

🧩 Features 
Modular Terraform layout with two core modules:
vpc → networking resources (VPC, subnets, Internet Gateway, NAT Gateway)
eks → EKS control plane and node groups
Multi-AZ deployment for high availability
Public/private subnet architecture with NAT Gateways
Remote state management supported via S3 backend and DynamoDB locking
IAM roles integrated into the EKS module
Easy validation and cleanup workflow

🗺️ Deployment Architecture Overview
The EKS cluster is deployed in the eu-west-3 (Paris) region across three Availability Zones for fault tolerance and scalability. The architecture includes:

VPC with public and private subnets in each AZ
Internet Gateway for external connectivity
NAT Gateways in public subnets for outbound access from private subnets
Amazon EKS control plane spanning all AZs
EKS worker nodes in private subnets
IAM roles provide the permissions needed for the EKS control plane and node groups

📁 Project Structure
├── main.tf           # Root module
├── variables.tf      # Root inputs
├── backend/          # Remote state resources (S3 + DynamoDB)
└── modules/          # Reusable modules
    ├── vpc/
    └── eks/

⚙️ Prerequisites
Terraform ≥ 1.0
AWS CLI configured with credentials and default region
kubectl installed
IAM user with permissions for: VPC, EKS, EC2, IAM, S3, DynamoDB

🚀 Quick Start

# Initialize Terraform
terraform init
Plan the deployment

terraform plan -out plan.tfplan

# Apply the plan

terraform apply "plan.tfplan"

# Configure kubeconfig and validate

aws eks update-kubeconfig --region eu-west-3 --name demo-eks-cluster

kubectl config get-contexts         # Confirm kubeconfig context
kubectl get nodes                   # Check worker nodes
kubectl get pods --all-namespaces   # Verify system pods

# Clean up resources
terraform destroy