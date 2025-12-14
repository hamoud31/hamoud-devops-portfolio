📌 Overview
This project demonstrates a complete CI/CD pipeline that builds a Java application, analyzes the code, pushes a Docker image to Amazon ECR, and automatically updates an ECS service. The pipeline includes a Quality Gate check, ensuring only clean and validated code gets deployed.

🛠️ Tools Used
GitHub – Source code

Jenkins – CI/CD automation

Maven – Build & tests

SonarQube – Code analysis & quality gate

Docker – Containerization

Amazon ECR – Image registry

Amazon ECS – Deployment platform

🔄 Pipeline Flow
Jenkins pulls the latest code from GitHub.

Maven builds the project and runs tests.

SonarQube analyzes the code.

Jenkins waits for the Quality Gate result.

If the gate fails, the pipeline stops.

If it passes, the pipeline continues.

Jenkins builds a Docker image.

The image is pushed to Amazon ECR.

Jenkins triggers an ECS service update to deploy the new image.

📦 Deployment Summary
Every commit triggers the pipeline.

Only high‑quality code passes the Quality Gate.

A new Docker image is pushed to ECR.

ECS automatically pulls the new image and redeploys the service.

Project Structure

Jenkinsfile
├── Dockerfile
├── architecture
├── src/
└── docs/
    └── images/

SonarQube analyzes the code.

