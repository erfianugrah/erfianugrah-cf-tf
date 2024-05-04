resource "cloudflare_pages_domain" "www" {
  account_id   = var.cloudflare_account_id
  project_name = "revista-4"
  domain       = "www.${var.domain_name}"
}
