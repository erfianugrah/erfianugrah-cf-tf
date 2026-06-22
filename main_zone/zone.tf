resource "cloudflare_zone" "erfianugrah" {
  account_id = var.cloudflare_account_id
  paused     = false
  plan       = "enterprise"
  type       = "full"
  zone       = var.domain_name
}

resource "cloudflare_zone" "erfi_dev" {
  account_id = var.cloudflare_account_id
  paused     = false
  plan       = "enterprise"
  type       = "full"
  zone       = var.secondary_domain_name
}

resource "cloudflare_zone" "erfi_io" {
  account_id = var.cloudflare_account_id
  paused     = false
  plan       = "enterprise"
  type       = "partial"
  zone       = var.tertiary_domain_name
}
