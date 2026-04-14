terraform {
 required_providers {
   okta = {
     source  = "okta/okta"
     version = "~> 4.0"
   }
 }
}
provider "okta" {
 org_name  = var.okta_org_name
 base_url  = "okta.com"
 api_token = var.okta_api_token
}