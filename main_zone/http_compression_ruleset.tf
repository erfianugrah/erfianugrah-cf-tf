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

  rules {
    action = "compress_response"
    action_parameters {
      algorithms {
        name = "gzip"
      }
    }
    description = "Compress responses for specific content types"
    enabled     = false
    expression  = "(http.host contains \"${var.domain_name}\") and (http.response.content_type.media_type in {\"text/html\" \"text/css\" \"text/javascript\" \"text/plain\" \"text/xml\" \"text/x-component\" \"application/javascript\" \"application/x-javascript\" \"application/json\" \"application/x-json\" \"application/xml\" \"application/text\" \"application/vnd.microsoft.icon\" \"application/vnd-ms-fontobject\" \"application/x-font-ttf\" \"application/x-font-opentype\" \"application/x-font-truetype\" \"application/xmlfont/eot\" \"font/opentype\" \"font/otf\" \"font/eot\" \"image/svg+xml\" \"image/vnd.microsoft.icon\"})"
  }
}
