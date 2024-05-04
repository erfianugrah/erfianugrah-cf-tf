resource "cloudflare_ruleset" "http_ratelimit" {
  kind    = "zone"
  name    = "default"
  phase   = "http_ratelimit"
  zone_id = var.cloudflare_zone_id
  rules {
    action      = "block"
    description = "Header Test"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/tag/muses\")"
    ratelimit {
      characteristics     = ["http.request.headers[\"erfi\"]", "cf.colo.id"]
      mitigation_timeout  = 60
      period              = 60
      requests_per_period = 10
    }
  }
  rules {
    action = "block"
    action_parameters {
      response {
        content      = "bobbity boop"
        content_type = "text/plain"
        status_code  = 429
      }
    }
    description = "Body Test"
    enabled     = false
    expression  = "(http.host contains \"${var.domain_name}\")"
    ratelimit {
      characteristics     = ["ip.src", "cf.colo.id"]
      counting_expression = "http.request.body.raw contains \"erfi\""
      mitigation_timeout  = 30
      period              = 10
      requests_per_period = 10
    }
  }
  rules {
    action      = "block"
    description = "Test CORS"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path eq \"/content/images/size/w750/wordpress/2019/09/14-3.jpg\")"
    ratelimit {
      characteristics     = ["ip.src", "cf.colo.id"]
      mitigation_timeout  = 10
      period              = 10
      requests_per_period = 10
    }
  }
  rules {
    action      = "challenge"
    description = "Test Challenge Passage"
    enabled     = true
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"muses\")"
    ratelimit {
      characteristics     = ["ip.src", "cf.colo.id"]
      mitigation_timeout  = 120
      period              = 60
      requests_per_period = 5
    }
  }
  rules {
    action      = "managed_challenge"
    description = "Bot < 5"
    enabled     = true
    expression  = "(cf.bot_management.score lt 5 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not ip.src in {118.189.189.102 195.240.81.42})"
    ratelimit {
      characteristics     = ["cf.unique_visitor_id", "ip.geoip.asnum", "cf.colo.id"]
      mitigation_timeout  = 120
      period              = 10
      requests_per_period = 100 
    }
  }
  rules {
    action      = "block"
    description = "Block request when response 425"
    enabled     = false
    expression  = "(http.host eq \"httpbun.erfianugrah.com\")"
    ratelimit {
      characteristics     = ["ip.src", "ip.geoip.asnum", "cf.colo.id"]
      mitigation_timeout  = 120
      period              = 60
      requests_per_period = 10
      counting_expression = "http.response.code eq 425"
    }
  }
}
