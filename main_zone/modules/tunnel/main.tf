resource "cloudflare_zero_trust_tunnel_cloudflared" "this" {
  account_id = var.account_id
  name       = var.name
  secret     = var.secret
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "this" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.this.id

  config {
    warp_routing {
      enabled = var.warp_routing
    }

    dynamic "ingress_rule" {
      for_each = var.ingress_rules
      content {
        hostname = ingress_rule.value.hostname
        path     = ingress_rule.value.path
        service  = ingress_rule.value.service

        dynamic "origin_request" {
          for_each = ingress_rule.value.origin_request != null ? [ingress_rule.value.origin_request] : []
          content {
            no_tls_verify      = origin_request.value.no_tls_verify
            http2_origin       = origin_request.value.http2_origin
            origin_server_name = origin_request.value.origin_server_name
            http_host_header   = origin_request.value.http_host_header

            dynamic "access" {
              for_each = origin_request.value.access != null ? [origin_request.value.access] : []
              content {
                required  = access.value.required
                team_name = access.value.team_name
                aud_tag   = access.value.aud_tag
              }
            }
          }
        }
      }
    }
  }

  # The Cloudflare API does not return warp_routing for tunnels without
  # private network routes, causing perpetual drift. Ignore it after creation.
  lifecycle {
    ignore_changes = [config[0].warp_routing]
  }
}

resource "cloudflare_zero_trust_tunnel_virtual_network" "this" {
  count      = var.vnet_name != null ? 1 : 0
  account_id = var.account_id
  name       = var.vnet_name
}

resource "cloudflare_zero_trust_tunnel_route" "this" {
  count              = var.route != null ? 1 : 0
  account_id         = var.account_id
  tunnel_id          = cloudflare_zero_trust_tunnel_cloudflared.this.id
  network            = var.route.network
  comment            = var.route.comment
  virtual_network_id = var.vnet_name != null ? cloudflare_zero_trust_tunnel_virtual_network.this[0].id : null
}
