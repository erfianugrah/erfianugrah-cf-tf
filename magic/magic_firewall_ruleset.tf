resource "cloudflare_magic_firewall_ruleset" "magic_firewall" {
  account_id  = var.cloudflare_account_id
  name        = "Magic WAN Firewall"
  description = "Default Magic WAN Firewall"

  rules = [
    {
      action      = "allow"
      expression  = "(ip.proto eq \"icmp\")"
      description = "Allow ICMP"
      enabled     = "true"
    },
    {
      action      = "allow"
      expression  = "(ip.src in {100.64.0.0/10})"
      description = "Allow WARP Virtual IPs"
      enabled     = "true"
    }
  ]
}
