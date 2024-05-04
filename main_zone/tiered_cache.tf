resource "cloudflare_tiered_cache" "smart" {
  zone_id    = var.cloudflare_zone_id
  cache_type = "smart"
}