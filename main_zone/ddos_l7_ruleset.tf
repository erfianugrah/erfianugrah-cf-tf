resource "cloudflare_ruleset" "ddos_l7" {
  kind    = "zone"
  name    = "zone"
  phase   = "ddos_l7"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "execute"
    action_parameters {
      id = "4d21379b4f9f4bb088e0729962c8b3cf"
      overrides {
        action            = "managed_challenge"
        sensitivity_level = "default"
      }
      version = "latest"
    }
    description = "Set All to Challenge"
    enabled     = true
    expression  = "true"
  }
}