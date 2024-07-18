resource "cloudflare_load_balancer_pool" "deno" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.ssgs.id
  name            = "Deno"
  origins {
    address = var.deno_domain
    enabled = true
    header {
      header = "Host"
      values = [var.deno_domain]
    }
    name   = "Deno"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "pages" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.ssgs.id
  name            = "Pages"
  origins {
    address = var.pages_domain
    enabled = true
    header {
      header = "Host"
      values = ["www.${var.domain_name}"]
    }
    name   = "Pages"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_sg" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_SG"
  origins {
    address = var.sg_ip
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    name   = "revista_sg"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_k3s_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_NL"
  origins {
    address = var.k3s_tunnel
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    name   = "revista_k3s_nl"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_proxmox_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_Proxmox_NL"
  origins {
    address = cloudflare_tunnel.proxmox.cname
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    name   = "revista_proxmox_nl"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_ipsec_k3s_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_IPsec_k3s_NL"
  origins {
    address = "10.0.71.100"
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    virtual_network_id = "be64e69c-e7b6-4e0e-9fd3-130757192c5b"
    name               = "revista_ipsec_k3s_nl"
    weight             = 1
  }
}

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
      values = ["httpbun-pie.${var.domain_name}"]
    }
    virtual_network_id = "be64e69c-e7b6-4e0e-9fd3-130757192c5b"
    name               = "httpbun_ipsec_erfipie_nl"
    weight             = 1
  }
}

resource "cloudflare_load_balancer_pool" "httpbun_ipsec_arch0_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.httpbun_arch0.id
  name            = "httpbun_ipsec_arch0_nl"
  origins {
    address = "10.68.73.3"
    enabled = true
    header {
      header = "Host"
      values = ["httpbun-arch0.${var.domain_name}"]
    }
    virtual_network_id = "be64e69c-e7b6-4e0e-9fd3-130757192c5b"
    name               = "httpbun_ipsec_arch0_nl"
    weight             = 1
  }
}
# resource "cloudflare_load_balancer_pool" "authentik_ipsec_k3s_nl" {
#   account_id      = var.cloudflare_account_id
#   check_regions   = ["ALL_REGIONS"]
#   enabled         = true
#   minimum_origins = 1
#   monitor         = cloudflare_load_balancer_monitor.authentik.id
#   name            = "Authentik_IPsec_k3s_NL"
#   origins {
#     address = "10.0.71.100"
#     enabled = true
#     header {
#       header = "Host"
#       values = ["authentik.${var.domain_name}"]
#     }
#     virtual_network_id = "be64e69c-e7b6-4e0e-9fd3-130757192c5b"
#     name               = "authentik_ipsec_k3s_nl"
#     weight             = 1
#   }
# }
