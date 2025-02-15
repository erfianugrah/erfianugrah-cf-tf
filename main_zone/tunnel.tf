resource "cloudflare_zero_trust_tunnel_cloudflared" "erfipie" {
  account_id = var.cloudflare_account_id
  name       = "erfipie"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "kvm_nl" {
  account_id = var.cloudflare_account_id
  name       = "kvm_nl"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "kvm_sg" {
  account_id = var.cloudflare_account_id
  name       = "kvm_sg"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "servarr" {
  account_id = var.cloudflare_account_id
  name       = "servarr"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "vyos_nl" {
  account_id = var.cloudflare_account_id
  name       = "vyos_nl"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "vyos_sg" {
  account_id = var.cloudflare_account_id
  name       = "vyos_sg"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "proxmox" {
  account_id = var.cloudflare_account_id
  name       = "proxmox"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "erfi1" {
  account_id = var.cloudflare_account_id
  name       = "erfi1"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}
