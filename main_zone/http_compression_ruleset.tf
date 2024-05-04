resource "cloudflare_ruleset" "http_response_compression" {
  kind    = "zone"
  name    = "default"
  phase   = "http_response_compression"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "compress_response"
    action_parameters {
      algorithms {
        name = "brotli"
      }
    }
    description = "Test compression"
    enabled     = false
    expression  = "(http.host contains \"${var.domain_name}\")"
  }
}