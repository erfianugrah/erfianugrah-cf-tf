resource "cloudflare_custom_ssl" "httpbun_nl" {
  zone_id = var.cloudflare_zone_id
  custom_ssl_options {
    certificate   = local.httpbun_nl_pem
    private_key   = local.httpbun_nl_key
    bundle_method = "force"
    type          = "legacy_custom"
  }
}
