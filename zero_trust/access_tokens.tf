resource "cloudflare_access_service_token" "prometheus_token" {
  account_id = var.cloudflare_account_id
  name       = "prometheus_unraid_token"
  duration   = "forever"
}

resource "cloudflare_access_service_token" "tunnel_secret_worker_token" {
  account_id = var.cloudflare_account_id
  name       = "tunnel_secret_worker_token"
  duration   = "forever"
}

resource "cloudflare_access_service_token" "caddy_api_token" {
  account_id = var.cloudflare_account_id
  name       = "caddy_api_token"
  duration   = "forever"
}

resource "cloudflare_access_service_token" "ollama_token" {
  account_id = var.cloudflare_account_id
  name       = "ollama_token"
  duration   = "forever"
}
