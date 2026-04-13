**## Architecture Diagram**

[View Architecture Diagram] (./diagrams/ci-cd-okta-aws.pdf)

# Architecture Decision Record 001
## EKS vs ECS Container Platform Selection

## Status
Accepted

## Context

The platform requires a container orchestration system to deploy and manage containerized workloads on AWS.

Two primary options were evaluated:

- Amazon Elastic Kubernetes Service (EKS)
- Amazon Elastic Container Service (ECS)

Both services provide container orchestration capabilities within AWS.

## Decision

Amazon EKS was selected as the primary container orchestration platform.

Amazon ECS is documented as an alternative deployment option for organizations that prefer AWS-native container orchestration without Kubernetes.

## Rationale

EKS was selected because:

- Kubernetes is an industry standard orchestration platform
- Strong ecosystem and tooling
- Portability across cloud environments
- Advanced deployment strategies such as Blue/Green and Canary
- Strong integration with CI/CD pipelines

ECS remains a viable alternative because:

- Simpler operational model
- Native integration with AWS services
- Option to run serverless containers using AWS Fargate

## Consequences

Using EKS allows the platform to demonstrate Kubernetes-based DevSecOps workflows.

However, ECS remains supported as an alternative orchestration model for organizations with different operational preferences.

On Apr 13, 2026, at 4:48 PM, latashatrue <latashatrue@gmail.com> wrote:

﻿Arch

# Architecture Overview

This document describes the technical architecture of the Secure DevSecOps Platform.  
The platform demonstrates a cloud-native DevSecOps environment using infrastructure-as-code, container orchestration, and automated CI/CD pipelines.

The system is designed to support secure, scalable, and automated deployments across multiple environments.


# System Architecture

The platform consists of the following major components:

Identity Provider
Okta is used for centralized identity and authentication.

Cloud Infrastructure
AWS provides the underlying compute, networking, and storage resources.

Infrastructure as Code
Terraform is used to provision infrastructure in a repeatable and automated manner.

Container Platform
Workloads are deployed using container orchestration platforms.

Primary Platform
Amazon EKS (Elastic Kubernetes Service)

Alternative Platform
Amazon ECS (Elastic Container Service)

Container Registry
Amazon ECR is used to store container images.


# Environment Structure

The platform supports multiple deployment environments to promote application stability and testing.

DEV  
QA  
UAT  
PREPROD  
PROD

Applications are promoted through these environments using the CI/CD pipeline.


# CI/CD Pipeline Architecture

The CI/CD pipeline automates infrastructure provisioning, application builds, testing, and deployments.

Pipeline stages include:

Developer commit
Pull request creation
Code review
CI pipeline execution
Security scanning
Terraform validation
Container image build
Container vulnerability scanning
Deployment to development environment
Promotion through QA, UAT, and Pre-Production
Production deployment


# Deployment Strategy

Application deployments use progressive rollout strategies to reduce deployment risk.

Blue-Green Deployment
A new environment is deployed while the existing environment remains active. Traffic is switched after validation.

Canary Deployment
A small percentage of traffic is routed to the new version before full deployment.


# Security Architecture

The platform follows Zero Trust security principles.

Security controls include:

Centralized authentication using Okta
Role-based access control
Least privilege IAM policies
Secure secrets management
Encrypted infrastructure state storage

Secrets are stored using AWS Secrets Manager.


# Infrastructure Security

Infrastructure is managed using Terraform with secure state management.

Security best practices include:

Remote Terraform state stored in Amazon S3
State locking using Amazon DynamoDB
Encryption enabled for state storage
Access control through IAM policies


# Monitoring and Observability

Monitoring and observability provide visibility into infrastructure and application health.

Monitoring tools may include:

Prometheus for metrics collection
Grafana for dashboards
Datadog for infrastructure and application monitoring

Alerts can be integrated with collaboration platforms such as Slack or Microsoft Teams.


# Scalability and Reliability

The platform is designed to scale with application demand.

Container orchestration allows automatic scaling of workloads.  
Cloud infrastructure provides high availability across multiple availability zones.


# Future Improvements

Potential future enhancements include:

Automated policy enforcement
Advanced security monitoring
Expanded CI/CD automation
Infrastructure compliance validation