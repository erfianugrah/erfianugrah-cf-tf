# RETIRED 2026-09-18: httpbun DNS record removed; fallback origin no longer exists.
# resource "cloudflare_custom_hostname_fallback_origin" "httpbun" {
#   zone_id = var.cloudflare_zone_id
#   origin  = "httpbun.${var.domain_name}"
# }