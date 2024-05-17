resource "cloudflare_r2_bucket" "http-logs" {
  account_id = var.cloudflare_account_id
  name       = "http-logs"
  location   = "APAC"
}

resource "cloudflare_r2_bucket" "images" {
  account_id = var.cloudflare_account_id
  name       = "images"
  location   = "APAC"
}

resource "cloudflare_r2_bucket" "portainer-backup" {
  account_id = var.cloudflare_account_id
  name       = "portainer-backup"
  location   = "APAC"
}

resource "cloudflare_r2_bucket" "audit-logs" {
  account_id = var.cloudflare_account_id
  name       = "audit-logs"
  location   = "WEUR"
}
