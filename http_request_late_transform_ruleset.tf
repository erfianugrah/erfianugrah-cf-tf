resource "cloudflare_ruleset" "http_request_late_transform" {
  kind    = "zone"
  name    = "header modification"
  phase   = "http_request_late_transform"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        expression = "cf.bot_management.score"
        name       = "Bot-Score"
        operation  = "set"
      }
      headers {
        expression = "ip.src.city"
        name       = "City"
        operation  = "set"
      }
      headers {
        expression = "cf.colo.id"
        name       = "Colo"
        operation  = "set"
      }
      headers {
        expression = "ip.src.country"
        name       = "Country"
        operation  = "set"
      }
      headers {
        expression = "cf.metal.id"
        name       = "Metal"
        operation  = "set"
      }
    }
    description = "Bot | City | Colo | Metal"
    enabled     = true
    expression  = "(http.host contains \"${var.domain_name}\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "X-Forwarded-For"
        operation = "remove"
      }
      headers {
        name      = "X-Real-IP"
        operation = "remove"
      }
    }
    description = "Remove XFF for Non CF IPs"
    enabled     = true
    expression  = "(ip.src in $cf_ips)"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "Accept"
        operation = "remove"
      }
    }
    description = "Remove Accept"
    enabled     = false
    expression  = "(http.request.full_uri eq \"https://${var.domain_name}/content/images/2021/08/Oliwka-13-2.jpg\")"
  }
  # rules {
  #   action = "rewrite"
  #   action_parameters {
  #     headers {
  #       name      = "Origin"
  #       value     = "caddy.${var.domain_name}"
  #       operation = "set"
  #     }
  #   }
  #   description = "Set Origin for Caddy API"
  #   enabled     = true
  #   expression  = "(http.host contains \"caddy.${var.domain_name}\")"
  # }
}
