data "cloudflare_rulesets" "account_managed_owasp_ruleset" {
  account_id = var.cloudflare_account_id

  filter {
    name  = ".*OWASP.*"
    phase = "http_request_firewall_managed"
  }
}

data "cloudflare_rulesets" "account_managed_cloudflare_ruleset" {
  account_id = var.cloudflare_account_id

  filter {
    name  = "Cloudflare Managed Ruleset"
    phase = "http_request_firewall_managed"
  }
}