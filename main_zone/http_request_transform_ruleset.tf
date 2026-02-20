resource "cloudflare_ruleset" "http_request_transform" {
  kind    = "zone"
  name    = "transfer ruleset"
  phase   = "http_request_transform"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "rewrite"
    action_parameters {
      uri {
        path {
          value = "/status/404"
        }
      }
    }
    description = "Test 404"
    enabled     = false
    expression  = "(ip.src ne ${var.nl_ip} and http.user_agent ne \"Blah\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      uri {
        path {
          value = "/"
        }
      }
    }
    description = "tenant1 to headers"
    enabled     = true
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path eq \"/tenant1\")"
  }
  rules {
    action = "rewrite"
    action_parameters {
      uri {
        path {
          value = "/blahblah"
        }
      }
    }
    description = "Test"
    enabled     = false
    expression  = "(http.host eq \"httpbun.${var.domain_name}\" and http.request.uri.path contains \"/headers\")"
  }
  # Removed: Loader — no active DNS
}
