resource "cloudflare_web_analytics_rule" "root" {
  depends_on = [cloudflare_web_analytics_site.root]
  account_id = var.cloudflare_account_id
  ruleset_id = cloudflare_web_analytics_site.root.ruleset_id
  host       = "*"
  paths      = ["*"]
  inclusive  = false
  is_paused  = false
}