# All tunnel definitions using the tunnel module
# Replaces: tunnel.tf, tunnel_config.tf, tunnel_secret.tf, tunnel_route.tf, tunnel_vnet.tf

module "tunnel_erfipie" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "erfipie"
  secret     = var.tunnel_secret

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
  secret     = var.tunnel_secret

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
  secret     = var.tunnel_secret

  ingress_rules = [
    { hostname = "ssh-pikvm-sg.${var.domain_name}", service = "ssh://localhost:22" },
    { service = "http_status:404" },
  ]
}

module "tunnel_servarr" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "servarr"
  secret     = var.tunnel_secret

  ingress_rules = [
    # erfi.io services
    { hostname = "radarr.${var.tertiary_domain_name}", service = "http://172.19.1.2:7878" },
    { hostname = "sonarr.${var.tertiary_domain_name}", service = "http://172.19.1.3:8989" },
    { hostname = "sabnzbd.${var.tertiary_domain_name}", service = "http://172.19.1.19:6666" },
    { hostname = "bazarr.${var.tertiary_domain_name}", service = "http://172.19.1.4:6767" },
    { hostname = "jellyfin.${var.tertiary_domain_name}", service = "http://172.19.1.15:8096" },
    { hostname = "prowlarr.${var.tertiary_domain_name}", service = "http://172.19.1.10:9696" },
    { hostname = "navidrome.${var.tertiary_domain_name}", service = "http://172.19.1.17:4533" },
    { hostname = "seerr.${var.tertiary_domain_name}", service = "http://172.19.1.21:5055" },
    { hostname = "copyparty.${var.tertiary_domain_name}", service = "http://172.19.66.2:3923" },
    { hostname = "vault.${var.tertiary_domain_name}", service = "http://172.19.4.2:80" },
    { hostname = "joplin.${var.tertiary_domain_name}", service = "http://172.19.13.2:22300" },
    { hostname = "file.${var.tertiary_domain_name}", service = "http://172.19.6.2:80" },
    { hostname = "servarr.${var.tertiary_domain_name}", service = "http://localhost:90" },
    { hostname = "dockge-sg.${var.tertiary_domain_name}", service = "http://172.17.0.2:5001" },
    { hostname = "immich.${var.tertiary_domain_name}", service = "http://172.19.22.2:2283" },
    { hostname = "qbit.${var.tertiary_domain_name}", service = "http://172.19.1.22:8080" },
    { hostname = "keycloak.${var.tertiary_domain_name}", service = "http://172.19.12.2:8080" },
    { hostname = "change.${var.tertiary_domain_name}", service = "http://172.19.3.2:5000" },
    # Primary domain services routed through servarr tunnel
    { service = "http_status:404" },
  ]

  vnet_name = "servarr_vnet"
  route     = { network = "172.19.0.0/16" }
}

module "tunnel_vyos_nl" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "vyos_nl"
  secret     = var.tunnel_secret

  ingress_rules = [
    { hostname = "prom-tunnel-nl.${var.domain_name}", service = "http://localhost:11000" },
    { hostname = "nl.vyos.${var.domain_name}", service = "ssh://localhost:22" },
    { hostname = "pihole-vyos-nl.${var.domain_name}", service = "http://10.0.10.2" },
    { hostname = "prom-vyos-nl.${var.domain_name}", service = "http://localhost:9100" },
    { hostname = "httpbun-nl.${var.domain_name}", service = "http://10.0.10.8:80" },
    { hostname = "gloryhole.${var.tertiary_domain_name}", path = "/metrics", service = "http://10.0.10.10:9090" },
    { hostname = "gloryhole.${var.tertiary_domain_name}", service = "http://10.0.10.10:8080" },
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
  secret     = var.tunnel_secret

  ingress_rules = [
    { hostname = "sg.vyos.${var.domain_name}", service = "ssh://localhost:22" },
    { hostname = "pihole-vyos-sg.${var.domain_name}", service = "http://172.16.0.4:80" },
    { service = "http_status:404" },
  ]

  vnet_name = "vyos_sg_vnet"
  route     = { network = "172.16.0.0/16" }
}
