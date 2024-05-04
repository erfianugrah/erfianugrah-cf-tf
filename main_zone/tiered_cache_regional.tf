resource "cloudflare_regional_tiered_cache" "regional" {
  zone_id = var.cloudflare_zone_id
  value   = "on"
}