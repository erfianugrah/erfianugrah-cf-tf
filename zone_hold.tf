resource "cloudflare_zone_hold" "erfi_hold" {
  zone_id = var.cloudflare_zone_id
  hold    = true
}