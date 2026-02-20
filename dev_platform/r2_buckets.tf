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

resource "cloudflare_r2_bucket" "images-wnam" {
  account_id = var.cloudflare_account_id
  name       = "images-wnam"
  location   = "WNAM"
}

resource "cloudflare_r2_bucket" "images-enam" {
  account_id = var.cloudflare_account_id
  name       = "images-enam"
  location   = "ENAM"
}

resource "cloudflare_r2_bucket" "images-eeur" {
  account_id = var.cloudflare_account_id
  name       = "images-eeur"
  location   = "EEUR"
}

resource "cloudflare_r2_bucket" "images-weur" {
  account_id = var.cloudflare_account_id
  name       = "images-weur"
  location   = "WEUR"
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

resource "cloudflare_r2_bucket" "videos" {
  account_id = var.cloudflare_account_id
  name       = "videos"
  location   = "WEUR"
}

resource "cloudflare_r2_bucket" "vaultwarden" {
  account_id = var.cloudflare_account_id
  name       = "vault"
  location   = "WEUR"
}
