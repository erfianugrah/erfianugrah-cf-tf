resource "cloudflare_zone_cache_reserve" "cache_reserve" {
  zone_id = var.cloudflare_zone_id
  enabled = true
}