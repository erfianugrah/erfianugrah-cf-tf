resource "cloudflare_web_analytics_site" "pages_agerng" {
  account_id   = var.cloudflare_account_id
  auto_install = false
  host         = var.pages_agerng_hostname
}
