resource "okta_user" "dev_user" {
 first_name = "Dev"
 last_name  = "User"
 login      = "dev.user@example.com"
 email      = "dev.user@example.com"
}

resource "okta_user_group_memberships" "dev_membership" {
 user_id = okta_user.dev_user.id
 groups = [
okta_group.developers.id
 ]
}