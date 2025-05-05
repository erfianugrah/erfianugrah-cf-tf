resource "cloudflare_web_analytics_site" "pages_agerng" {
  account_id   = var.cloudflare_account_id
  auto_install = false
  host         = var.pages_agerng_hostname
}

resource "cloudflare_web_analytics_site" "pages_revista3" {
  account_id   = var.cloudflare_account_id
  auto_install = false
  host         = var.pages_revista3_hostname
}

resource "cloudflare_web_analytics_site" "pages_revista4" {
  account_id   = var.cloudflare_account_id
  auto_install = false
  host         = var.pages_revista4_hostname
}

resource "cloudflare_web_analytics_site" "erfi-dev-docs" {
  account_id   = var.cloudflare_account_id
  auto_install = false
  host         = var.pages_dev_docs_hostname
}
