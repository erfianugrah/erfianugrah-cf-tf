resource "cloudflare_web_analytics_site" "root" {
  account_id   = var.cloudflare_account_id
  zone_tag     = var.cloudflare_zone_id
  auto_install = true
}