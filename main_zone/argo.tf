resource "cloudflare_argo" "argo" {
  zone_id        = var.cloudflare_zone_id
  smart_routing  = "on"
}