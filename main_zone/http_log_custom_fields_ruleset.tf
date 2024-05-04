resource "cloudflare_ruleset" "http_log_custom_fields" {
  kind    = "zone"
  name    = "http_log_custom_fields"
  phase   = "http_log_custom_fields"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "log_custom_field"
    action_parameters {
      request_fields = ["bot-score", "city", "colo", "metal", "cf-access-user", "test"]
    }
    description = "Set Logpush custom fields for HTTP requests"
    enabled     = true
    expression  = "true"
  }
}