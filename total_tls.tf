resource "cloudflare_total_tls" "total_tls" {
  zone_id               = var.cloudflare_zone_id
  enabled               = true
  certificate_authority = "lets_encrypt"
}
