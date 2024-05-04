output "account_roles" {
  value = data.cloudflare_account_roles.account_roles.roles 
}
output "token_scopes" {
  value = data.cloudflare_api_token_permission_groups.all
}
output "cloudflare_api_token_root_token" {
  value = cloudflare_api_token.root_token.value
  sensitive = true
}

output "cloudflare_api_token_caddy_dns" {
  value = cloudflare_api_token.caddy_dns.value
  sensitive = true
}

output "cloudflare_api_token_traefik_dns" {
  value = cloudflare_api_token.traefik_dns.value
  sensitive = true
}

output "cloudflare_api_token_insomnia" {
  value = cloudflare_api_token.insomnia.value
  sensitive = true
}

output "cloudflare_api_token_cloudflare_exporter" {
  value = cloudflare_api_token.cloudflare_exporter.value
  sensitive = true
}

output "cloudflare_api_token_logpush_r2_token" {
  value = cloudflare_api_token.logpush_r2_token.value
  sensitive = true
}

output "cloudflare_api_token_wrangler" {
  value = cloudflare_api_token.wrangler.value
  sensitive = true
}
