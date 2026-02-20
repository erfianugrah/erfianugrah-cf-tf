data "cloudflare_rulesets" "managed_waf" {
  zone_id = cloudflare_zone.erfianugrah.id

  filter {
    kind  = "managed"
    phase = "http_request_firewall_managed"
  }
  include_rules = true
}
