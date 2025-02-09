resource "cloudflare_zone" "erfianugrah" {
  account_id = var.cloudflare_account_id
  paused     = false
  plan       = "enterprise"
  type       = "full"
  zone       = var.domain_name
}
