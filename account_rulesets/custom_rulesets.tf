resource "cloudflare_ruleset" "account_custom_ruleset" {
  account_id  = var.cloudflare_account_id
  name        = "Default_Account_Custom_Ruleset"
  description = "Default_Account_Custom_Ruleset"
  kind        = "custom"
  phase       = "http_request_firewall_custom"

  rules {
    enabled     = "true"
    action      = "block"
    expression  = "(not ssl)"
    description = "Block non-HTTPs"
  }
}

resource "cloudflare_ruleset" "account_rl_ruleset" {
  account_id  = var.cloudflare_account_id
  name        = "Default_Account_Rate_Limiting_Ruleset"
  description = "Default_Account_Rate_Limiting_Ruleset"
  kind        = "custom"
  phase       = "http_ratelimit"

  rules {
    action      = "block"
    description = "Global Default Rate Limit"
    enabled     = false
    expression  = "http.host matches \".*\""
    ratelimit {
      characteristics     = ["ip.src", "cf.colo.id"]
      mitigation_timeout  = 60
      period              = 60
      requests_per_period = 1000
      requests_to_origin  = true
    }
  }
}

