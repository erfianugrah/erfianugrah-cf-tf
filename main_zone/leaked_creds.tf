resource "cloudflare_leaked_credential_check" "erfianugrah" {
  zone_id = var.cloudflare_zone_id
  enabled = true
}
