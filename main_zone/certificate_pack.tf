resource "cloudflare_certificate_pack" "acm" {
  certificate_authority = "lets_encrypt"
  cloudflare_branding   = false
  hosts                 = [var.domain_name, "*.${var.domain_name}"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
  zone_id               = var.cloudflare_zone_id
}

