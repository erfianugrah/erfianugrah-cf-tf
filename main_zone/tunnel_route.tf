resource "cloudflare_tunnel_route" "erfipie" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.erfipie.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.erfipie.id
}

resource "cloudflare_tunnel_route" "kvm_nl" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.kvm_nl.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.kvm_nl.id
}

resource "cloudflare_tunnel_route" "kvm_sg" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.kvm_sg.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.kvm_sg.id
}

resource "cloudflare_tunnel_route" "servarr" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.servarr.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.servarr.id
}

resource "cloudflare_tunnel_route" "vyos_nl" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.vyos_nl.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.vyos_nl.id
}

resource "cloudflare_tunnel_route" "vyos_sg" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.vyos_sg.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.vyos_sg.id
}

resource "cloudflare_tunnel_route" "proxmox" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_tunnel.proxmox.id
  network            = "0.0.0.0/0"
  virtual_network_id = cloudflare_tunnel_virtual_network.proxmox.id
}
