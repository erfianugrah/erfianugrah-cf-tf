resource "cloudflare_tunnel" "erfipie" {
  account_id = var.cloudflare_account_id
  name       = "erfipie"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "kvm_nl" {
  account_id = var.cloudflare_account_id
  name       = "kvm_nl"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "kvm_sg" {
  account_id = var.cloudflare_account_id
  name       = "kvm_sg"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "servarr" {
  account_id = var.cloudflare_account_id
  name       = "servarr"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "vyos_nl" {
  account_id = var.cloudflare_account_id
  name       = "vyos_nl"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "vyos_sg" {
  account_id = var.cloudflare_account_id
  name       = "vyos_sg"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_tunnel" "proxmox" {
  account_id = var.cloudflare_account_id
  name       = "proxmox"
  secret     = base64encode(random_string.tunnel_secret.result)
  config_src = "cloudflare"
}
