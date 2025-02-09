resource "cloudflare_hostname_tls_setting_ciphers" "root" {
  zone_id  = var.cloudflare_zone_id
  hostname = var.domain_name
  value    = ["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-CHACHA20-POLY1305", "ECDHE-ECDSA-AES256-GCM-SHA384"]
}
resource "cloudflare_hostname_tls_setting_ciphers" "httpbun" {
  zone_id  = var.cloudflare_zone_id
  hostname = "httpbun.${var.domain_name}"
  value    = ["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-CHACHA20-POLY1305", "ECDHE-RSA-AES128-GCM-SHA256", "ECDHE-RSA-CHACHA20-POLY1305", "ECDHE-ECDSA-AES256-GCM-SHA384", "ECDHE-RSA-AES256-GCM-SHA384", "ECDHE-ECDSA-AES128-SHA256", "ECDHE-RSA-AES128-SHA256", "ECDHE-ECDSA-AES256-SHA384", "ECDHE-RSA-AES256-SHA384", "ECDHE-ECDSA-AES128-SHA", "ECDHE-RSA-AES128-SHA", "AES128-GCM-SHA256", "AES128-SHA256", "AES128-SHA", "ECDHE-RSA-AES256-SHA", "AES256-GCM-SHA384", "AES256-SHA256", "AES256-SHA", "DES-CBC3-SHA"]
}
