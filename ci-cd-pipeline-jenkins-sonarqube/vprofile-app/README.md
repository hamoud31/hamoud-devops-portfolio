# 🚀 CI/CD Pipeline for Java Application Deployment on AWS ECS

A fully automated CI/CD pipeline for building, analyzing, containerizing, and deploying a Java application using **Jenkins**, **SonarQube**, **Docker**, **Amazon ECR**, and **Amazon ECS**.  
This project demonstrates real-world DevOps practices with automated quality enforcement and cloud‑native deployment workflows.



## 📌 Overview

This project implements an end‑to‑end CI/CD pipeline that:

- Builds and tests a Java application  
- Performs static code analysis with SonarQube  
- Enforces a **Quality Gate** to block low‑quality code  
- Builds and pushes a Docker image to **Amazon ECR**  
- Deploys the application to **Amazon ECS**  

Only validated, high‑quality code is allowed to reach production.



## 🏗 Architecture 

### Workflow Overview

1. Developer pushes code to GitHub  
2. Jenkins pulls the latest commit  
3. Maven runs unit tests and Checkstyle  
4. SonarQube performs static code analysis  
5. Jenkins waits for the **Quality Gate** result  
6. If the Quality Gate passes:  
   - Docker image is built  
   - Image is pushed to Amazon ECR  
   - ECS service is updated with the new image  
7. ECS automatically redeploys the application  



## 🛠 Tools & Technologies

| Tool / Service | Purpose |
|----------------|---------|
| **GitHub** | Source code management |
| **Jenkins** | CI/CD automation |
| **Maven** | Build, unit tests, Checkstyle |
| **SonarQube** | Static code analysis & Quality Gate |
| **Docker** | Application containerization |
| **Amazon ECR** | Docker image registry |
| **Amazon ECS** | Application deployment platform |



## 🔄 CI/CD Pipeline Flow

1. Jenkins fetches the source code from GitHub  
2. Maven builds the application and runs unit tests  
3. Checkstyle validates coding standards  
4. SonarQube analyzes the code  
5. Jenkins waits for the Quality Gate  
   - ❌ **Fails** → Pipeline stops  
   - ✅ **Passes** → Pipeline continues  
6. Docker image is built and tagged  
7. Image is pushed to Amazon ECR  
8. Jenkins updates the ECS service  
9. ECS pulls the new image and redeploys automatically  



## 📦 Deployment Summary

- Every commit triggers the CI/CD pipeline  
- Only high‑quality code passes the Quality Gate  
- A new Docker image is pushed to ECR  
- ECS automatically redeploys the updated service  

This ensures consistent, reliable, and secure deployments.



## 🔧 CI/CD Implementation Details

- Pipeline defined using **Jenkinsfile** (Pipeline as Code)  
- Quality Gate enforced using `waitForQualityGate`  
- Docker images are **immutable and versioned**  
- ECS service update performed via **AWS CLI**  
- Fully automated deployment — no manual steps required  



## 🔐 Security & Best Practices

- Quality Gate blocks vulnerable or low‑quality code  
- Pipeline fails fast on test or analysis errors  
- Immutable Docker images ensure consistent deployments  
- CI/CD pipeline is fully reproducible and environment‑agnostic  



## 📁 Project Structure


.
├── Jenkinsfile          # Jenkins CI/CD pipeline definition
├── Dockerfile           # Application containerization
├── src/                 # Java application source code
├── architecture/        # Architecture diagrams
├── docs/
│   └── images/          # Screenshots
```



## 📸 Pipeline Evidence

Screenshots demonstrating pipeline execution and deployment:

| Stage                  | Screenshot                       |
|------------------------|----------------------------------|
| Jenkins Pipeline       | docs/images/jenkins-pipeline.png |
| SonarQube Quality Gate | docs/images/sonarqube.png        |
| Amazon ECR             | docs/images/ecr.png              |
| Amazon ECS Deployment  | docs/images/ecs.png              |



## 📄 License

This project is intended for **learning, demonstration, and portfolio** purposes.

---

## ⭐ Why This Project Matters

This project showcases:

- Real-world CI/CD automation  
- Enforced code quality and security  
- Cloud-native deployment on AWS  
- DevOps best practices using modern tooling  
- A fully automated, production‑style delivery workflow  

