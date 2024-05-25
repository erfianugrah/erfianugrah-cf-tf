resource "cloudflare_tunnel_virtual_network" "erfipie" {
  account_id = var.cloudflare_account_id
  name       = "erfipie_vnet"
}

resource "cloudflare_tunnel_virtual_network" "kvm_nl" {
  account_id = var.cloudflare_account_id
  name       = "kvm_nl_vnet"
}

resource "cloudflare_tunnel_virtual_network" "kvm_sg" {
  account_id = var.cloudflare_account_id
  name       = "kvm_sg_vnet"
}

resource "cloudflare_tunnel_virtual_network" "servarr" {
  account_id = var.cloudflare_account_id
  name       = "servarr_vnet"
}

resource "cloudflare_tunnel_virtual_network" "vyos_nl" {
  account_id = var.cloudflare_account_id
  name       = "vyos_nl_vnet"
}

resource "cloudflare_tunnel_virtual_network" "vyos_sg" {
  account_id = var.cloudflare_account_id
  name       = "vyos_sg_vnet"
}

resource "cloudflare_tunnel_virtual_network" "proxmox" {
  account_id = var.cloudflare_account_id
  name       = "proxmox_vnet"
}
