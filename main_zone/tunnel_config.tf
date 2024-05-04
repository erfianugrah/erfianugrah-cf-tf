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
