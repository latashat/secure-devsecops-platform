# Deployment Strategy
## Overview
This system uses **direct CI/CD deployment to AWS EKS using GitHub Actions** with Kubernetes Rolling Updates as the primary deployment strategy.
---
## Deployment Model
### Primary Strategy: Rolling Updates
Kubernetes handles deployments using:
- Zero-downtime updates
- Gradual pod replacement
- Health check–driven rollout control
### Configuration
- maxSurge: 1
- maxUnavailable: 1
This ensures:
- No full capacity loss during deployment
- Safe incremental rollout
---
## Release Flow
1. Code is merged into `main`
2. CI pipeline builds Docker image
3. Image is pushed to AWS ECR
4. GitHub Actions updates deployment in EKS
5. Kubernetes performs rolling update
6. Health probes validate new version
---
## Image Versioning Strategy
- Immutable tags only
- Format: `git SHA` (e.g., `a3f9c21`)
- Never use `latest`
This ensures:
- reproducibility
- rollback safety
- auditability
---
## Rollback Strategy
If issues occur:
### Option 1 (preferred)
```bash
kubectl rollout undo deployment/my-app