# DevOps Showcase 
# Cloud Development Environment with CI/CD Pipeline

## Overview
A fully automated cloud-based development environment using code-server, deployed on AWS EC2 with a complete CI/CD pipeline. This project demonstrates modern DevOps practices including containerization, infrastructure automation, and secure deployment strategies.

## Problem Statement
Traditional development environments face several challenges:
- Inconsistency across different machines and team members
- Limited accessibility (tied to specific hardware)
- Manual deployment processes prone to errors
- Difficulty maintaining development tool versions

## Solution
Built a cloud-native development environment that provides:
- Browser-accessible VS Code (code-server) with full development capabilities
- Automated build and deployment pipeline
- Consistent environment across all access points
- Global content delivery through CloudFront CDN

## Architecture
GitHub Repository
↓
GitHub Actions (CI/CD)
↓
Amazon ECR (Container Registry)
↓
AWS Systems Manager (SSM)
↓
EC2 Instance (Docker)
↓
CloudFront CDN

## Technology Stack

### Core Infrastructure
- **AWS EC2**: Ubuntu 22.04 instance hosting the containerized application
- **AWS ECR**: Private container registry for Docker images
- **AWS Systems Manager (SSM)**: Secure, agentless deployment without SSH
- **AWS CloudFront**: CDN for global access and improved performance
- **Docker**: Containerization platform

### Development Tools (Inside Container)
- **code-server**: Browser-based VS Code
- **PHP 8.2**: With extensions (mbstring, xml, bcmath, curl, zip, gd)
- **Composer**: PHP dependency manager
- **Node.js 18 LTS**: JavaScript runtime
- **npm**: Node package manager
- **AWS CLI v2**: Cloud infrastructure management
- **Git**: Version control
- **Additional tools**: curl, wget, htop, tmux, jq, make, build-essential

### CI/CD Pipeline
- **GitHub Actions**: Automated workflows
- **Docker**: Multi-stage builds for optimization

## Key Features

### 1. Automated CI/CD Pipeline
- Triggered on push to `code-server-aws-deploy` branch
- Builds Docker image with all development tools
- Pushes to private ECR repository
- Deploys to EC2 via SSM commands
- Zero-downtime deployments

### 2. Secure Deployment
- Uses AWS Systems Manager instead of SSH
- No exposed SSH ports
- IAM role-based authentication
- Secrets managed through GitHub Secrets

### 3. Scalable Architecture
- Containerized application (easy to replicate)
- CloudFront CDN for global distribution
- Stateless container design
- Volume mounts for persistent data

## Project Structure
.
├── Dockerfile                 # Container definition with dev tools
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD pipeline configuration
└── README.md                 

## CI/CD Workflow

### Build Job
1. Checkout code from repository
2. Configure AWS credentials
3. Login to Amazon ECR
4. Build Docker image
5. Tag and push to ECR

### Deploy Job
1. Find EC2 instance by tag name
2. Construct ECR image URI
3. Send SSM commands to EC2:
   - Login to ECR
   - Stop existing container
   - Pull latest image
   - Start new container with restart policy

## Security Considerations

- AWS credentials stored as GitHub Secrets
- EC2 security groups restrict inbound traffic
- IAM roles follow principle of least privilege
- Container runs with non-root user
- No hardcoded passwords in repository
- SSM for secure command execution

## Deployment Process
```bash
# Push code to deployment branch
git push origin code-server-aws-deploy

# GitHub Actions automatically:
# 1. Builds Docker image
# 2. Pushes to ECR
# 3. Deploys to EC2
# 4. Restarts container
Skills Demonstrated

DevOps: CI/CD pipeline design and implementation
Cloud Infrastructure: AWS services (EC2, ECR, SSM, CloudFront, IAM)
Containerization: Docker image creation and optimization
Infrastructure as Code: GitHub Actions workflows
Linux Administration: Ubuntu server management
Security: IAM policies, security groups, secrets management
Networking: Port mapping, CDN configuration
Automation: Scripting, deployment automation

Future Improvements

 Add SSL/TLS with ACM certificate
 Implement Application Load Balancer
 Add health checks and auto-recovery
 Set up CloudWatch monitoring and alerts
 Implement backup strategy for persistent data
 Add Terraform for infrastructure as code
 Multi-environment support (dev/staging/prod)

Lessons Learned

SSM vs SSH: SSM provides better security without managing SSH keys
Docker Port Mapping: Understanding container vs host port binding
ECR Authentication: Handling token-based authentication in CI/CD
CloudFront Behavior: Configuring cache policies for dynamic applications
GitHub Actions Secrets: Proper secret management in workflows

Contact
Perpetua Ayogu
Perpyayogu@gmail.com
http://linkedin.com/in/ayogu-perpetua-b0b210236
Portfolio Website: https://ubatrillion.wixsite.com/my-site
codeserver url:https://d2b91rhajw5ae9.cloudfront.net/
