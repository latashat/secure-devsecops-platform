resource "okta_policy_mfa" "mfa_policy" {
 name        = "MFA Policy"
 description = "Require MFA for developers"
 status      = "ACTIVE"
}