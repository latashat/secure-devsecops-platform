### Never store tokens in Git Ensure GitHub Secrets are stored in GitHub Secrets or your CI pipeline
variable "okta_org_name" {
 description = "Okta organization name"
 type        = string
}
variable "okta_api_token" {
 description = "Okta API token"
 type        = string
 sensitive   = true
}