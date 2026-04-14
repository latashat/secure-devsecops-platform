# pipeline-design.md (CI/CD ARCHITECTURE)
```md id="pd-final-001"
# CI/CD Pipeline Design
## Overview
This pipeline uses **GitHub Actions for CI/CD with direct deployment to AWS EKS**.
No intermediate deployment platform is used.
---
## Architecture Flow
```text
Developer
  ↓
GitHub PR + Merge
  ↓
GitHub Actions CI Pipeline
  ↓
Docker Image Build
  ↓
Security Scan (optional)
  ↓
Push Image to AWS ECR
  ↓
Deploy to AWS EKS (kubectl or Helm)
  ↓
Kubernetes Rolling Update