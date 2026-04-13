# Architecture Decision Record 002
## Terraform Remote State Strategy

## Status
Accepted

## Context

The platform uses Terraform to manage infrastructure across multiple environments including dev, QA, UAT, preprod, and production.

A secure and consistent method for storing and managing Terraform state is required.

## Decision

Terraform remote state will be stored in Amazon S3 with state locking enabled using Amazon DynamoDB.

## Rationale

This approach was selected because it provides:

- Centralized and durable state storage
- Encryption at rest for sensitive infrastructure data
- State locking to prevent concurrent modifications
- Versioning support for rollback and recovery
- High availability and scalability within AWS

## Implementation Details

- S3 bucket stores Terraform state files
- DynamoDB table handles state locking
- IAM policies restrict access to approved roles only
- Server-side encryption is enabled for all state files

## Consequences

This approach ensures safe multi-environment infrastructure management and reduces risk of state corruption or race conditions during deployments.