resource "cloudflare_ruleset" "http_request_dynamic_redirect" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_dynamic_redirect"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 301
        target_url {
          expression = "concat(\"https://\", http.host, http.request.uri.path)"
        }
      }
    }
    description = "HTTP to HTTPs"
    enabled     = true
    expression  = "(not ssl)"
  }
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = false
        status_code           = 301
        target_url {
          expression = "regex_replace(http.request.full_uri, \"^http\", \"https\")"
        }
      }
    }
    description = "HTTP to HTTPs v2"
    enabled     = false
    expression  = "(http.request.full_uri matches \"^http://\")"
  }
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 302
        target_url {
          expression = "concat(\"https://httpbun.${var.domain_name}\", http.request.uri.path)"
        }
      }
    }
    description = "Test to sub.test"
    enabled     = true
    expression  = "(http.host contains \"httpbun-k3s.${var.domain_name}\" and http.request.uri.path contains \"/headers\")"
  }
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 301
        target_url {
          value = "https://${var.domain_name}/coffee"
        }
      }
    }
    description = "Test Pages"
    enabled     = true
    expression  = "(http.host contains \"coffee-time.pages.dev\")"
  }
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 301
        target_url {
          expression = "concat(\"https://www.${var.domain_name}\", http.request.uri.path)"
        }
      }
    }
    description = "@ to WWW"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\")"
  }
  rules {
    action = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = false
        status_code           = 301
        target_url {
          value = "https://${var.domain_name}/cn2"
        }
      }
    }
    description = "Test CN redirect"
    enabled     = true
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/test2\" and any(http.request.headers[\"accept-language\"][*] contains \"zh-CN\")) "
  }
}