resource "cloudflare_load_balancer_pool" "httpbun_ipsec_erfipie_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.httpbun_erfipie.id
  name            = "httpbun_ipsec_erfipie_nl"
  origins {
    address = "10.0.69.7"
    enabled = true
    header {
      header = "Host"
      values = ["httpbun-pie.${var.tertiary_domain_name}"]
    }
    virtual_network_id = module.tunnel_vyos_nl.vnet_id
    name               = "httpbun_ipsec_erfipie_nl"
    weight             = 1
  }
}

# resource "cloudflare_load_balancer_pool" "vault_servarr" {
#   account_id      = var.cloudflare_account_id
#   check_regions   = ["ALL_REGIONS"]
#   enabled         = true
#   minimum_origins = 1
#   monitor         = cloudflare_load_balancer_monitor.vaultwarden.id
#   name            = "vault_servarr"
#   origins {
#     address = module.tunnel_servarr.cname
#     enabled = true
#     header {
#       header = "Host"
#       values = ["vault.${var.tertiary_domain_name}"]
#     }
#     name   = "vault_servarr"
#     weight = 1
#   }
# }

# resource "cloudflare_load_balancer_pool" "vault_k3s" {
#   account_id      = var.cloudflare_account_id
#   check_regions   = ["ALL_REGIONS"]
#   enabled         = true
#   minimum_origins = 1
#   name            = "vault_k3s"
#   origins {
#     address = var.k3s_tunnel
#     enabled = true
#     header {
#       header = "Host"
#       values = ["vault.${var.tertiary_domain_name}"]
#     }
#     name   = "vault_k3s"
#     weight = 1
#   }
# }

resource "cloudflare_load_balancer_pool" "jitsi_ipsec_k3s_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.jitsi.id
  name            = "jitsi_ipsec_k3s_NL"
  origins {
    address = "10.0.71.100"
    enabled = true
    header {
      header = "Host"
      values = ["jitsi.${var.tertiary_domain_name}"]
    }
    virtual_network_id = module.tunnel_vyos_nl.vnet_id
    name               = "jitsi_ipsec_k3s_nl"
    weight             = 1
  }
}
