resource "cloudflare_ruleset" "http_custom_errors" {
  kind    = "zone"
  name    = "default"
  phase   = "http_custom_errors"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "serve_error"
    action_parameters {
      content      = "{\"message\": \"A 503 error occurred, maybe.\"}"
      content_type = "application/json"
    }
    enabled    = true
    expression = "any(http.response.headers[\"country\"][*] == \"NL\") and (http.response.code eq 503 and http.host eq \"httpbun.${var.domain_name}\")"
  }
}