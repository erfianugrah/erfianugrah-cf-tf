# resource "cloudflare_pages_domain" "www" {
#   account_id   = var.cloudflare_account_id
#   project_name = "revista-4"
#   domain       = "www.${var.domain_name}"
# }
#
# resource "cloudflare_pages_domain" "root" {
#   account_id   = var.cloudflare_account_id
#   project_name = "revista-4"
#   domain       = var.domain_name
# }

# resource "cloudflare_pages_domain" "docs" {
#   account_id   = var.cloudflare_account_id
#   project_name = "erfi-dev-docs"
#   domain       = var.dev_domain_name
# }
