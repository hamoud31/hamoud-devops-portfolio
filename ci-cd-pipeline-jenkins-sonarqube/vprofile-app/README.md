🚀 CI/CD Pipeline for Java Application Deployment on AWS ECS
📌 Overview

This project demonstrates a complete end-to-end CI/CD pipeline for a Java application using Jenkins, SonarQube, Docker, and AWS ECS.

The pipeline automatically:

Builds and tests the application

Performs static code analysis and enforces a Quality Gate

Builds and pushes a Docker image to Amazon ECR

Deploys the application to Amazon ECS

Only validated and high-quality code is allowed to reach production.

🏗 Architecture

Workflow overview:

Developer pushes code to GitHub

Jenkins pulls the latest code

Maven runs unit tests and Checkstyle

SonarQube performs static code analysis

Jenkins waits for the Quality Gate result

If the Quality Gate passes:

Docker image is built

🛠 Tools & Technologies

GitHub – Source code management

Jenkins – CI/CD automation

Maven – Build, unit tests, and Checkstyle

SonarQube – Static code analysis & Quality Gate

Docker – Application containerization

Amazon ECR – Docker image registry

Amazon ECS – Application deployment platform

🔄 CI/CD Pipeline Flow

Jenkins fetches the source code from GitHub

Maven builds the application and runs unit tests

Checkstyle validates coding standards

SonarQube analyzes the code

Jenkins waits for the SonarQube Quality Gate

❌ Pipeline stops if the gate fails

✅ Pipeline continues if the gate passes

Docker image is built and tagged

Image is pushed to Amazon ECR

Jenkins updates the ECS service

ECS redeploys the application automatically

📦 Deployment Summary

Every commit triggers the CI/CD pipeline

Only high-quality code passes the Quality Gate

A new Docker image is pushed to ECR

ECS pulls the new image and redeploys the service automatically

🔧 CI/CD Implementation Details

Pipeline implemented using Jenkinsfile (Pipeline as Code)

Quality Gate enforced using waitForQualityGate

Docker images are immutable and versioned

ECS service update performed via AWS CLI

Fully automated deployment with no manual intervention

🔐 Security & Best Practices

Quality Gate prevents vulnerable or low-quality code from being deployed

Pipeline fails fast on test or analysis errors

Immutable Docker images ensure consistent deployments

CI/CD pipeline is fully reproducible

📁 Project Structure
.
├── Jenkinsfile          # Jenkins CI/CD pipeline definition
├── Dockerfile           # Application containerization
├── src/                 # Java application source code
├── architecture/        # Architecture diagrams
├── docs/
│   └── images/          # Screenshots

📸 Pipeline Evidence
Screenshots demonstrating the pipeline execution and deployment
| Stage                  | Screenshot                       |
| ---------------------- | -------------------------------- |
| Jenkins Pipeline       | docs/images/jenkins-pipeline.png |
| SonarQube Quality Gate | docs/images/sonarqube.png        |
| Amazon ECR             | docs/images/ecr.png              |
| Amazon ECS Deployment  | docs/images/ecs.png              |

📄 License

This project is for learning, demonstration, and portfolio purposes.

⭐ Why This Project Matters

This project showcases:

Real-world CI/CD practices

Automated quality enforcement

Cloud-native deployments on AWS

DevOps best practices using modern tools



Image is pushed to Amazon ECR

ECS service is updated with the new image
