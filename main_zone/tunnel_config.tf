resource "cloudflare_tunnel_config" "erfipie" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.erfipie.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "pie.${var.domain_name}"
      service  = "ssh://localhost:22"
      origin_request {
        access {
          required  = true
          team_name = "erfianugrah"
          aud_tag   = ["280683d90dc02141a886ff96b33db0d103c3f76b0911d07eb9ef56a1bb721c2b"]
        }
      }
    }
    ingress_rule {
      hostname = "prom-exporter-pi.${var.domain_name}"
      service  = "http://localhost:9100"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "kvm_nl" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.kvm_nl.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "ssh-pikvm-nl.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      hostname = "kvm-nl.${var.domain_name}"
      service  = "https://localhost:443"
      origin_request {
        no_tls_verify = true
        http2_origin  = true
      }
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "kvm_sg" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.kvm_sg.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "ssh-pikvm-sg.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "servarr" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.servarr.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "prom-caddy-sg.${var.domain_name}"
      service  = "http://localhost:2018"
    }
    ingress_rule {
      hostname = "port.${var.domain_name}"
      service  = "http://172.17.0.2:9000"
    }
    # ingress_rule {
    #   hostname = "caddy.${var.domain_name}"
    #   service  = "http://localhost:2019"
    #   origin_request {
    #     # origin_server_name = "caddy.${var.domain_name}"
    #     http_host_header = "caddy.${var.domain_name}"
    #   }
    # }
    # ingress_rule {
    #   hostname = "plex.${var.domain_name}"
    #   service  = "http://172.19.0.8:32400"
    # }
    # ingress_rule {
    #   hostname = "vaultwarden.${var.domain_name}"
    #   service  = "http://172.19.4.2:80"
    # }
    # ingress_rule {
    #   hostname = "vaultwarden.${var.domain_name}"
    #   path     = "notifications/hub"
    #   service  = "http://172.19.0.2:3012"
    # }
    # ingress_rule {
    #   hostname = "joplin.${var.domain_name}"
    #   service  = "http://172.41.0.2:22300"
    # }
    # ingress_rule {
    #   hostname = "file.${var.domain_name}"
    #   service  = "http://172.26.0.2:80"
    # }
    ingress_rule {
      hostname = "servarr.${var.domain_name}"
      service  = "http://localhost:90"
    }
    # ingress_rule {
    #   hostname = var.domain_name
    #   service  = "http://172.66.0.2:4321"
    # }
    # ingress_rule {
    #   hostname = "caddy.${var.domain_name}"
    #   service  = "http://localhost:2019"
    #   origin_request {
    #     http_host_header = "caddy.erfianugrah.com"
    #   }
    # }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "vyos_nl" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.vyos_nl.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "prom-tunnel-nl.${var.domain_name}"
      service  = "http://localhost:11000"
    }
    ingress_rule {
      hostname = "prom-caddy-nl.${var.domain_name}"
      service  = "http://172.18.0.4:2018"
    }
    ingress_rule {
      hostname = "vyos-ssh.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "vyos_sg" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.vyos_sg.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "pihole-vyos-sg.${var.domain_name}"
      service  = "http://172.18.0.2:80"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "proxmox" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.proxmox.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "proxmox-ssh.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      hostname = "proxmox.${var.domain_name}"
      service  = "https://localhost:8006"
      origin_request {
        origin_server_name = "proxmox.${var.domain_name}"
        http2_origin       = true
      }
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}
