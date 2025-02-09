resource "cloudflare_custom_hostname_fallback_origin" "httpbun" {
  zone_id =  var.cloudflare_zone_id
  origin  = "httpbun.${var.domain_name}"
}