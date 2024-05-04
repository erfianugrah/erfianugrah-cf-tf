resource "cloudflare_hostname_tls_setting" "root" {
  zone_id  = var.cloudflare_zone_id
  hostname = var.domain_name
  setting  = "min_tls_version"
  value    = "1.3"
}

resource "cloudflare_hostname_tls_setting" "httpbun" {
  zone_id  = var.cloudflare_zone_id
  hostname = "httpbun.${var.domain_name}"
  setting  = "min_tls_version"
  value    = "1.0"
}

