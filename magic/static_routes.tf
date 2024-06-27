resource "cloudflare_static_route" "eth1_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "ETH1"
  prefix      = "10.0.69.0/24"
  nexthop     = "10.0.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth1_100_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "VLAN_100"
  prefix      = "10.0.70.0/24"
  nexthop     = "10.0.100.20"
  priority    = 100
}


resource "cloudflare_static_route" "podman_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "Podman"
  prefix      = "172.18.0.0/16"
  nexthop     = "10.0.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth2_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "ETH2"
  prefix      = "10.0.72.0/24"
  nexthop     = "10.0.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth1_200_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "VLAN_200"
  prefix      = "10.0.71.0/24"
  nexthop     = "10.0.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth3_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "ETH3"
  prefix      = "10.68.73.0/24"
  nexthop     = "10.0.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "erfikvm_sg_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "erfikvm_sg_ipsec"
  prefix      = "10.68.69.0/24"
  nexthop     = "10.68.77.20"
  priority    = 100
}
