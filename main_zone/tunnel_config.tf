resource "cloudflare_zero_trust_tunnel_cloudflared_config" "erf1" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.erfi1.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "ollama-ui.${var.domain_name}"
      service  = "http://172.19.8.3:8080"
    }
    ingress_rule {
      hostname = "ollama.${var.domain_name}"
      service  = "http://172.19.8.2:11434"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "erfipie" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.erfipie.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "pie.${var.domain_name}"
      service  = "ssh://localhost:22"
      # origin_request {
      #   access {
      #     required  = true
      #     team_name = "erfianugrah"
      #     aud_tag   = ["280683d90dc02141a886ff96b33db0d103c3f76b0911d07eb9ef56a1bb721c2b"]
      #   }
      # }
    }
    ingress_rule {
      hostname = "prom-exporter-pi.${var.domain_name}"
      service  = "http://localhost:9100"
    }
    ingress_rule {
      hostname = "atuin.${var.domain_name}"
      service  = "http://172.20.1.2:8888"
    }
    ingress_rule {
      hostname = "tldraw.${var.domain_name}"
      service  = "http://172.40.1.2:5858"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "kvm_nl" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.id

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

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "kvm_sg" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.kvm_sg.id

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

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "servarr" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.servarr.id

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
    ingress_rule {
      hostname = "plex.${var.domain_name}"
      service  = "http://172.19.1.8:32400"
    }
    ingress_rule {
      hostname = "radarr.${var.domain_name}"
      service  = "http://172.19.1.2:7878"
    }
    ingress_rule {
      hostname = "sonarr.${var.domain_name}"
      service  = "http://172.19.1.3:8989"
    }
    ingress_rule {
      hostname = "sabnzbd.${var.domain_name}"
      service  = "http://172.19.1.19:6666"
    }
    ingress_rule {
      hostname = "bazarr.${var.domain_name}"
      service  = "http://172.19.1.4:6767"
    }
    ingress_rule {
      hostname = "jellyfin.${var.domain_name}"
      service  = "http://172.19.1.15:8096"
    }
    ingress_rule {
      hostname = "tautulli.${var.domain_name}"
      service  = "http://172.19.1.14:8181"
    }
    ingress_rule {
      hostname = "prowlarr.${var.domain_name}"
      service  = "http://172.19.1.10:9696"
    }
    ingress_rule {
      hostname = "overseerr.${var.domain_name}"
      service  = "http://172.19.1.13:5055"
    }
    ingress_rule {
      hostname = "navidrome.${var.domain_name}"
      service  = "http://172.19.1.17:4533"
    }
    ingress_rule {
      hostname = "midarr.${var.domain_name}"
      service  = "http://172.19.1.20:4000"
    }
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
    ingress_rule {
      hostname = "file.${var.domain_name}"
      service  = "http://172.19.6.2:80"
    }
    ingress_rule {
      hostname = "servarr.${var.domain_name}"
      service  = "http://localhost:90"
    }
    ingress_rule {
      hostname = "dockge-sg.${var.domain_name}"
      service  = "http://172.17.0.2:5001"
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

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "vyos_nl" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.id

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
      hostname = "nl.vyos.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      hostname = "pihole-vyos-nl.${var.domain_name}"
      service  = "http://10.0.10.2"
    }
    ingress_rule {
      hostname = "prom-vyos-nl.${var.domain_name}"
      service  = "http://localhost:9100"
    }
    ingress_rule {
      hostname = "httpbun-nl.${var.domain_name}"
      service  = "http://10.0.10.8:80"
    }
    ingress_rule {
      hostname = "tpi.${var.domain_name}"
      service  = "https://10.0.71.8:443"
      origin_request {
        no_tls_verify = true
      }
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "vyos_sg" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.vyos_sg.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = "sg.vyos.${var.domain_name}"
      service  = "ssh://localhost:22"
    }
    ingress_rule {
      hostname = "pihole-vyos-sg.${var.domain_name}"
      service  = "http://172.16.0.4:80"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "proxmox" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.proxmox.id

  config {
    warp_routing {
      enabled = true
    }
    ingress_rule {
      hostname = var.domain_name
      service  = "http://10.68.73.3:8000"
    }
    ingress_rule {
      hostname = "pve.proxmox.${var.domain_name}"
      service  = "ssh://localhost:22"
      # origin_request {
      #   bastion_mode = true
      # }
    }
    ingress_rule {
      hostname = "arch0.proxmox.${var.domain_name}"
      service  = "ssh://10.68.73.3:22"
      # origin_request {
      #   bastion_mode = true
      # }
    }
    ingress_rule {
      hostname = "arch1.proxmox.${var.domain_name}"
      service  = "ssh://10.68.73.101:22"
      # origin_request {
      #   bastion_mode = true
      # }
    }
    ingress_rule {
      hostname = "arch2.proxmox.${var.domain_name}"
      service  = "ssh://10.68.73.102:22"
      # origin_request {
      #   bastion_mode = true
      # }
    }
    ingress_rule {
      hostname = "arch3.proxmox.${var.domain_name}"
      service  = "ssh://10.68.73.103:22"
      # origin_request {
      #   bastion_mode = true
      # }
    }
    ingress_rule {
      hostname = "arch4.proxmox.${var.domain_name}"
      service  = "ssh://10.68.73.104:22"
      # origin_request {
      #   bastion_mode = true
      # }
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
      hostname = "plex-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:32400"
    }
    ingress_rule {
      hostname = "jellyfin-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:8096"
    }
    ingress_rule {
      hostname = "prowlarr-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:9696"
    }
    ingress_rule {
      hostname = "radarr-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:7878"
    }
    ingress_rule {
      hostname = "sonarr-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:8989"
    }
    ingress_rule {
      hostname = "bazarr-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:6767"
    }
    ingress_rule {
      hostname = "tautulli-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:6767"
    }
    ingress_rule {
      hostname = "navidrome-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:4533"
    }
    ingress_rule {
      hostname = "solvarr-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:8191"
    }
    ingress_rule {
      hostname = "sabnzbd-mox.${var.secondary_domain_name}"
      service  = "http://10.68.73.3:8080"
    }
    ingress_rule {
      hostname = "vaultwarden.${var.domain_name}"
      service  = "http://10.68.73.3:9999"
    }
    ingress_rule {
      hostname = "vaultwarden.${var.domain_name}"
      path     = "notifications/hub"
      service  = "http://10.68.73.3:10000"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}
