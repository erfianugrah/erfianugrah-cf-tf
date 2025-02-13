data "cloudflare_rulesets" "managed_waf" {
  zone_id = cloudflare_zone.erfianugrah.id

  filter {
    kind  = "managed"
    phase = "http_request_firewall_managed"
  }
  include_rules = true
}

# Query OWASP specific ruleset
data "cloudflare_rulesets" "owasp" {
  zone_id = cloudflare_zone.erfianugrah.id

  filter {
    name = ".*OWASP.*"
    kind = "managed"
  }
  include_rules = true
}
