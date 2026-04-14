resource "okta_group" "developers" {

  name        = "Developers"

  description = "Developer access group"

}
 
resource "okta_group" "admins" {

  name        = "Admins"

  description = "Administrative access group"

}
 