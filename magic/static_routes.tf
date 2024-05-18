resource "cloudflare_static_route" "eth1_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "ETH1"
  prefix      = "10.68.69.0/24"
  nexthop     = "10.68.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth1_100_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "VLAN_100"
  prefix      = "10.68.70.0/24"
  nexthop     = "10.68.100.20"
  priority    = 100
}


resource "cloudflare_static_route" "podman_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "Podman"
  prefix      = "172.18.0.0/16"
  nexthop     = "10.68.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth2_vyos_nl_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "ETH2"
  prefix      = "10.72.0.0/16"
  nexthop     = "10.68.100.20"
  priority    = 100
}

resource "cloudflare_static_route" "eth1_200_ipsec" {
  account_id  = var.cloudflare_account_id
  description = "VLAN_200"
  prefix      = "10.68.71.0/24"
  nexthop     = "10.68.100.20"
  priority    = 100
}
