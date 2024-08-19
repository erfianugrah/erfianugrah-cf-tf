# resource "cloudflare_web_analytics_rule" "pages_agerng" {
#   depends_on = [cloudflare_web_analytics_site.pages_agerng]
#   account_id = var.cloudflare_account_id
#   ruleset_id = cloudflare_web_analytics_site.pages_agerng.ruleset_id
#   host       = "*"
#   paths      = ["*"]
#   inclusive  = false
#   is_paused  = false
# }
