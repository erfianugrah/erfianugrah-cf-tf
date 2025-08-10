resource "cloudflare_zero_trust_access_identity_provider" "keycloak_oidc" {
  account_id = var.cloudflare_account_id
  name       = "Keycloak OIDC"
  type       = "oidc"
  config {
    auth_url      = "https://keycloak.${var.domain_name}/auth/realms/unkers/protocol/openid-connect/auth"
    certs_url     = "https://keycloak.${var.domain_name}/auth/realms/unkers/protocol/openid-connect/certs"
    claims        = ["email", "full name", "given name", "family name", "upn", "realm roles", "profile", "groups"]
    client_id     = var.keycloak_oidc_client_id
    client_secret = var.keycloak_oidc_secret
    scopes        = ["openid", "email", "profile"]
    token_url     = "https://keycloak.${var.domain_name}/auth/realms/unkers/protocol/openid-connect/token"
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "gmail" {
  account_id = var.cloudflare_account_id
  name       = "Gmail"
  type       = "google"
  config {
    client_id        = var.google_client_id
    client_secret    = var.google_secret
    email_claim_name = "email"
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "google_workspace" {
  account_id = var.cloudflare_account_id
  name       = "Google Workspace"
  type       = "google-apps"
  config {
    apps_domain      = var.domain_name
    client_id        = var.google_workspace_client_id
    client_secret    = var.google_workspace_secret
    claims           = ["family_name", "given_name", "name"]
    email_claim_name = "email"
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "authentik_oidc" {
  account_id = var.cloudflare_account_id
  name       = "Authentik OIDC"
  type       = "oidc"
  config {
    auth_url         = "https://authentik.${var.domain_name}/application/o/authorize/"
    certs_url        = "https://authentik.${var.domain_name}/application/o/cloudflare-access/jwks/"
    claims           = ["given_name", "preferred_username", "nickname", "groups", "role"]
    client_id        = var.authentik_oidc_client_id
    client_secret    = var.authentik_oidc_secret
    email_claim_name = "email"
    scopes           = ["openid", "email", "profile"]
    token_url        = "https://authentik.${var.domain_name}/application/o/token/"
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "pin" {
  account_id = var.cloudflare_account_id
  name       = "PIN login"
  type       = "onetimepin"
}

# resource "cloudflare_zero_trust_access_identity_provider" "authentik_saml" {
#   account_id = var.cloudflare_account_id
#   name       = "Authentik SAML"
#   type       = "saml"
#   config {
#     email_attribute_name = "email"
#     attributes           = ["email", "surname", "givenName"]
#     issuer_url           = "https://erfianugrah.cloudflareaccess.com/cdn-cgi/access/callback"
#     sso_target_url       = "https://authentik.${var.domain_name}/application/saml/cloudflare-access-saml/sso/binding/redirect/"
#     idp_public_cert      = local.authentik_pem
#     sign_request         = true
#   }
# }

resource "cloudflare_zero_trust_access_identity_provider" "entra_id" {
  account_id = var.cloudflare_account_id
  name       = "Entra ID"
  type       = "azureAD"
  config {
    client_id      = var.entra_id_client_id
    client_secret  = var.entra_id_secret
    directory_id   = var.entra_id_directory_id
    support_groups = true
  }
  scim_config {
    enabled                  = true
    group_member_deprovision = true
    seat_deprovision         = true
    secret                   = var.entra_scim_secret
    user_deprovision         = true
  }
}

