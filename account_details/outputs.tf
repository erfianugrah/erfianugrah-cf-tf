# Removed 'sensitive = true' from all token outputs so they show directly in console after apply 
# If you want to hide these values from console output, add 'sensitive = true' back to each token output

output "account_roles" {
  value     = data.cloudflare_account_roles.account_roles
  sensitive = true
}

output "token_scopes" {
  value     = data.cloudflare_api_token_permission_groups.all
  sensitive = true
}

output "cloudflare_api_token_root_token" {
  value     = cloudflare_api_token.root_token.value
  sensitive = true
}

output "cloudflare_api_token_caddy_dns" {
  value     = cloudflare_api_token.caddy_dns.value
  sensitive = true
}

output "cloudflare_api_token_traefik_dns" {
  value     = cloudflare_api_token.traefik_dns.value
  sensitive = true
}

output "cloudflare_api_token_gloryhole_dns" {
  value     = cloudflare_api_token.gloryhole_dns.value
  sensitive = true
}

output "cloudflare_api_token_insomnia" {
  value     = cloudflare_api_token.insomnia.value
  sensitive = true
}

output "cloudflare_api_token_cloudflare_exporter" {
  value     = cloudflare_api_token.cloudflare_exporter.value
  sensitive = true
}

output "cloudflare_api_token_admin_r2_read_write_token" {
  value     = cloudflare_api_token.admin_r2_read_write_token.value
  sensitive = true
}

output "cloudflare_api_token_admin_r2_s3_credentials" {
  value = {
    access_key_id     = cloudflare_api_token.admin_r2_read_write_token.id
    secret_access_key = sha256(cloudflare_api_token.admin_r2_read_write_token.value)
  }
  sensitive = true
}

output "cloudflare_api_token_wrangler" {
  value     = cloudflare_api_token.wrangler.value
  sensitive = true
}

output "cloudflare_api_token_cache_purge" {
  value     = cloudflare_api_token.cache_purge.value
  sensitive = true
}

output "cloudflare_api_token_kv_admin" {
  value     = cloudflare_api_token.kv_admin.value
  sensitive = true
}

output "success" {
  value = local.success
}

output "error" {
  value = local.success ? null : try(local.first_response.errors[0].message, "Unknown error")
}

output "accounts" {
  value = local.accounts
}

output "total_accounts" {
  value = length(local.accounts)
}
