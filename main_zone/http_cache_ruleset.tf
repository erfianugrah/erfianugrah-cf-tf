resource "cloudflare_ruleset" "http_request_cache_settings" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_cache_settings"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "set_cache_settings"
    action_parameters {
      cache = false
    }
    description = " Cache Bypass"
    enabled     = true
    expression  = "(http.host in {\"servarr.${var.domain_name} \" \"pihole.${var.domain_name}\" \"kvm.${var.domain_name}\" \"nzb.${var.domain_name}\" \"qbit.${var.domain_name}\" \"plex.${var.domain_name}\" \"file.${var.domain_name}\" \"home.${var.domain_name}\" \"kvm-nl.${var.domain_name}\" \"sabnzbd.${var.domain_name}\" \"loader.${var.domain_name}\"})"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      browser_ttl {
        default = 31536000
        mode    = "override_origin"
      }
      cache = true
      edge_ttl {
        default = 31536000
        mode    = "override_origin"
      }
      read_timeout = 3600
      serve_stale {
        disable_stale_while_updating = false
      }
    }
    description = "Astro"
    enabled     = true
    expression  = "(http.host in {\"cdn.${var.domain_name}\"  \"www.${var.domain_name}\" \"${var.domain_name}\" })"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      cache = true
      edge_ttl {
        default = 3
        mode    = "override_origin"
      }
    }
    description = "Test Status Codes"
    enabled     = false
    expression  = "(http.host eq \"httpbun.${var.domain_name}\" and http.request.uri.path contains \"/status\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      browser_ttl {
        default = 60
        mode    = "override_origin"
      }
      cache = true
      cache_key {
        custom_key {
          header {
            include = ["Authorization"]
          }
        }
      }
    }
    description = "test"
    enabled     = false
    expression  = "(http.host eq \"httpbun.${var.domain_name}\" and http.request.uri.path eq \"/headers\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      cache = true
    }
    description = "Immich"
    enabled     = false
    expression  = "(http.host eq \"immich.${var.domain_name}\" and http.request.uri.path contains \"/api/asset/thumbnail\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      browser_ttl {
        mode = "respect_origin"
      }
      cache = true
      cache_key {
        cache_deception_armor = true
        custom_key {
          header {
            include = ["x-auth"]
          }
          host {
            resolved = false
          }
          query_string {
            include = ["auth", "inline", "key"]
          }
        }
      }
      edge_ttl {
        mode = "respect_origin"
      }
      origin_error_page_passthru = true
      serve_stale {
        disable_stale_while_updating = true
      }
    }
    description = "Filebrowser Cache Key"
    enabled     = false
    expression  = "(http.host eq \"file.${var.domain_name}\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      browser_ttl {
        default = 14400
        mode    = "override_origin"
      }
      cache = true
      cache_key {
        custom_key {
          query_string {
            exclude = ["*"]
          }
        }
      }
      edge_ttl {
        default = 31536000
        mode    = "override_origin"
      }
    }
    description = "React App"
    enabled     = true
    expression  = "(http.host eq \"react.${var.domain_name}\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      browser_ttl {
        default = 3600
        mode    = "override_origin"
      }
      cache = true
      edge_ttl {
        default = 3600
        mode    = "override_origin"
      }
    }
    description = "Dillinger Cache Override"
    enabled     = true
    expression  = "(http.host eq \"dillinger.${var.domain_name}\")"
  }
  rules {
    action = "set_cache_settings"
    action_parameters {
      cache = true
      cache_key {
        cache_deception_armor = true
        custom_key {
          query_string {
            include = ["u", "t", "s", "id"]
          }
        }
      }
      edge_ttl {
        default = 10
        mode    = "override_origin"
      }
      read_timeout = 600
      serve_stale {
        disable_stale_while_updating = true
      }
    }
    description = "Navidrome"
    enabled     = false
    expression  = "(http.host eq \"navidrome.${var.domain_name}\" and http.request.uri.path contains \"/rest/stream\")"
  }
}
