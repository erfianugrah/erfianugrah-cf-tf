# All tunnel definitions using the tunnel module
# Replaces: tunnel.tf, tunnel_config.tf, tunnel_secret.tf, tunnel_route.tf, tunnel_vnet.tf

module "tunnel_erfipie" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "erfipie"
  secret     = var.tunnel_secret_erfipie

  ingress_rules = [
    { hostname = "pie.${var.domain_name}", service = "ssh://localhost:22" },
    { hostname = "prom-exporter-pi.${var.domain_name}", service = "http://localhost:9100" },
    { hostname = "atuin.${var.domain_name}", service = "http://172.20.1.2:8888" },
    {
      hostname = "draw.${var.secondary_domain_name}"
      service  = "https://172.41.1.2:443"
      origin_request = {
        origin_server_name = "draw.${var.secondary_domain_name}"
      }
    },
    { hostname = "uptime.${var.secondary_domain_name}", service = "http://172.25.1.2:3001" },
    { service = "http_status:404" },
  ]

  vnet_name = "erfipie_vnet"
  route     = { network = "172.17.0.0/16" }
}

module "tunnel_kvm_nl" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "kvm_nl"
  secret     = var.tunnel_secret_kvm_nl

  ingress_rules = [
    { hostname = "ssh-pikvm-nl.${var.domain_name}", service = "ssh://localhost:22" },
    {
      hostname = "kvm-nl.${var.domain_name}"
      service  = "https://localhost:443"
      origin_request = {
        no_tls_verify = true
        http2_origin  = true
      }
    },
    { service = "http_status:404" },
  ]
}

module "tunnel_kvm_sg" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "kvm_sg"
  secret     = var.tunnel_secret_kvm_sg

  ingress_rules = [
    { hostname = "ssh-pikvm-sg.${var.domain_name}", service = "ssh://localhost:22" },
    { service = "http_status:404" },
  ]
}

module "tunnel_servarr" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "servarr"
  secret     = var.tunnel_secret_servarr

  # NOTE: all tertiary (erfi.io) ingress rules removed 2026-07-21. erfi.io is a
  # partial zone with authoritative DNS on Knot; Knot serves these hosts direct
  # (A -> sg_ip, plus AAAA -> CF for the v6 path which CF routes via the
  # media_dns proxied A records, not the tunnel). The rules never saw traffic.
  # Pre-existing: file.erfi.io 523s - Knot CNAMEs it to cdn.cloudflare.net but
  # CF DNS has an A record, and CF cannot reach the home origin.
  ingress_rules = [
    { service = "http_status:404" },
  ]

  vnet_name = "servarr_vnet"
  route     = { network = "172.19.0.0/16" }
}

module "tunnel_vyos_nl" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "vyos_nl"
  secret     = var.tunnel_secret_vyos_nl

  # NOTE: gloryhole.erfi.io ingress removed 2026-07-21 - the name does not
  # exist in Knot (authoritative), so it never resolved publicly.
  ingress_rules = [
    { hostname = "prom-tunnel-nl.${var.domain_name}", service = "http://localhost:11000" },
    { hostname = "nl.vyos.${var.domain_name}", service = "ssh://localhost:22" },
    { hostname = "pihole-vyos-nl.${var.domain_name}", service = "http://10.0.10.2" },
    { hostname = "prom-vyos-nl.${var.domain_name}", service = "http://localhost:9100" },
    { hostname = "httpbun-nl.${var.domain_name}", service = "http://10.0.10.8:80" },
    {
      hostname = "tpi.${var.domain_name}"
      service  = "https://10.0.71.8:443"
      origin_request = {
        no_tls_verify = true
      }
    },
    { service = "http_status:404" },
  ]

  vnet_name = "vyos_nl_vnet"
  route     = { network = "172.18.0.3/32" }
}

module "tunnel_vyos_sg" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "vyos_sg"
  secret     = var.tunnel_secret_vyos_sg

  ingress_rules = [
    { hostname = "sg.vyos.${var.domain_name}", service = "ssh://localhost:22" },
    { hostname = "pihole-vyos-sg.${var.domain_name}", service = "http://172.16.0.4:80" },
    { service = "http_status:404" },
  ]

  vnet_name = "vyos_sg_vnet"
  route     = { network = "172.16.0.0/16" }
}
