# threat-model.md (SECURITY MODEL)
```md id="tm-final-001"
# Threat Model
## System Scope
This threat model covers:
- AWS EKS cluster
- GitHub Actions CI/CD pipeline
- AWS ECR container registry
- Kubernetes workloads and secrets
---
## Assets
- Application containers
- Kubernetes workloads
- CI/CD credentials
- IAM roles
- Secrets (DB passwords, API keys)
---
## Threats & Mitigations
---
### 1. Supply Chain Attack
**Risk:**
Malicious code introduced via dependencies or container images
**Mitigations:**
- pinned dependency versions
- immutable image tags (git SHA)
- container vulnerability scanning
- minimal base images
---
### 2. Credential Exposure
**Risk:**
Leaked AWS credentials or secrets
**Mitigations:**
- AWS IAM OIDC authentication (no static keys)
- least privilege IAM roles
- secrets stored in AWS Secrets Manager or Kubernetes Secrets (encrypted)
---
### 3. Container Escape
**Risk:**
Attacker escapes container sandbox
**Mitigations:**
- runAsNonRoot
- readOnlyRootFilesystem
- drop Linux capabilities
- disable privilege escalation
---
### 4. CI/CD Pipeline Abuse
**Risk:**
Unauthorized deployments via CI/CD system
**Mitigations:**
- protected branches (main)
- required PR approvals
- scoped IAM deployment roles
- restricted workflow permissions
---
### 5. Data Exposure
**Risk:**
Sensitive data exposed via logs or environment variables
**Mitigations:**
- avoid logging secrets
- encryption at rest (AWS KMS)
- encryption in transit (TLS)
- strict RBAC policies
---
### 6. Cluster-Level Attack
**Risk:**
Unauthorized access to Kubernetes API
**Mitigations:**
- RBAC least privilege
- namespace isolation
- audit logging enabled