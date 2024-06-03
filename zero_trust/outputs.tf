output "authentik_saas_oidc_sso_endpoint" {
  value     = cloudflare_access_application.authentik_saas.saas_app
  sensitive = true
}


