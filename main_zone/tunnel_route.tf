resource "cloudflare_zero_trust_tunnel_route" "erfipie" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.erfipie.id
  network            = "172.17.0.0/16"
  virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.erfipie.id
}

# resource "cloudflare_zero_trust_tunnel_route" "kvm_nl" {
#   account_id         = var.cloudflare_account_id
#   tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.id
#   network            = "0.0.0.0/0"
#   virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.kvm_nl.id
# }
#
# resource "cloudflare_zero_trust_tunnel_route" "kvm_sg" {
#   account_id         = var.cloudflare_account_id
#   tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.kvm_sg.id
#   network            = "0.0.0.0/0"
#   virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.kvm_sg.id
# }

resource "cloudflare_zero_trust_tunnel_route" "servarr" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.servarr.id
  network            = "172.19.0.0/16"
  virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.servarr.id
}

resource "cloudflare_zero_trust_tunnel_route" "vyos_nl" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.id
  network            = "172.18.0.3/32"
  virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.vyos_nl.id
}

resource "cloudflare_zero_trust_tunnel_route" "vyos_sg" {
  account_id         = var.cloudflare_account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.vyos_sg.id
  network            = "172.16.0.0/16"
  virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.vyos_sg.id
}

# resource "cloudflare_zero_trust_tunnel_route" "proxmox" {
#   account_id         = var.cloudflare_account_id
#   tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.proxmox.id
#   network            = "0.0.0.0/0"
#   virtual_network_id = cloudflare_zero_trust_tunnel_virtual_network.proxmox.id
# }
