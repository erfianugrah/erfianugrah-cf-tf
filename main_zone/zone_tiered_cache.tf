resource "cloudflare_tiered_cache" "generic" {
  zone_id    = var.cloudflare_zone_id
  cache_type = "generic"
}
