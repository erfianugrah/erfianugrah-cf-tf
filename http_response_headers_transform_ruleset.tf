resource "cloudflare_ruleset" "http_response_headers_transform" {
  kind    = "zone"
  name    = "default"
  phase   = "http_response_headers_transform"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "alt-svc"
        operation = "remove"
      }
    }
    description = "Set alt-svc to h2"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "Expect-CT"
        operation = "remove"
      }
    }
    description = "Remove Expect-CT"
    enabled     = true
    expression  = "true"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        expression = "ip.src.country"
        name       = "Country"
        operation  = "set"
      }
    }
    description = "Set country"
    enabled     = true
    expression  = "(http.host eq \"httpbun.${var.domain_name}\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "Strict-Transport-Security"
        operation = "set"
        value     = "max-age=15552000; includeSubDomains; preload"
      }
    }
    description = "STS"
    enabled     = false
    expression  = "(http.host eq \"httpbun.${var.domain_name}\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "access-control-allow-origin"
        operation = "set"
        value     = "*"
      }
    }
    description = "CORS Reset"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path eq \"/content/images/size/w750/wordpress/2019/09/14-3.jpg\" and http.response.code eq 429)"
  }
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "Content-Security-Policy"
        operation = "remove"
      }
    }
    description = "Remove CSP from privatebin"
    enabled     = false
    expression  = "(http.host contains \"privatebin.${var.domain_name}\")"
  }
}