resource "okta_app_oauth" "internal_app" {
 label       = "Internal DevOps Platform"
 type        = "web"
 grant_types = ["authorization_code"]
 redirect_uris = [
   "https://dev.example.com/callback"
 ]
}