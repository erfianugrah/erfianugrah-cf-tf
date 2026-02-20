resource "cloudflare_ruleset" "http_request_origin" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_origin"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "route"
    action_parameters {
      origin {
        port = 9000
      }
    }
    description = "Traefik"
    enabled     = true
    expression  = "(http.host in {\"traefik-dash.${var.domain_name}\"})"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "coffee.test.${var.domain_name}"
      sni {
        value = "coffee.test.${var.domain_name}"
      }
    }
    description = "Coffee"
    enabled     = true
    expression  = "(http.host eq \"test2.erfi.me\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "httpbinpub.${var.domain_name}"
      sni {
        value = "httpbinpub.${var.domain_name}"
      }
    }
    description = "Override to httpbin"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path eq \"/content\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "vyos-node-exporter.${var.domain_name}"
      sni {
        value = "vyos-node-exporter.${var.domain_name}"
      }
    }
    description = "Test Host Override"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/metrics\")"
  }
  # Removed: Pages.dev (coffee-time.pages.dev) — hostname not in account
  rules {
    action = "route"
    action_parameters {
      host_header = "docs.${var.domain_name}"
      sni {
        value = "docs.${var.domain_name}"
      }
    }
    description = "Test Pages on a path"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and starts_with(http.request.uri.path, \"/pages\"))"
  }
  # Removed: React Host Override — no active DNS
  rules {
    action = "route"
    action_parameters {
      host_header = "coffee.test.${var.domain_name}"
    }
    description = "Staticky Host"
    enabled     = false
    expression  = "(http.host eq \"staticky.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = var.domain_name
      origin {
        host = var.domain_name
      }
    }
    description = "WWW to @ Host"
    enabled     = false
    expression  = "(http.host eq \"www.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      origin {
        port = 2053
      }
    }
    description = "KVM"
    enabled     = true
    expression  = "(http.host eq \"kvm.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      origin {
        port = 2054
      }
    }
    description = "KVM-NL"
    enabled     = false
    expression  = "(http.host eq \"kvm-nl.${var.domain_name}\")"
  }
  # Removed: Router (home) — no active DNS
  rules {
    action = "route"
    action_parameters {
      host_header = "httpbun.com"
      origin {
        host = "tenant1.erfi.dev"
      }
    }
    description = "Origin - erfi.dev"
    enabled     = true
    expression  = "(http.host eq \"${var.domain_name}\" and raw.http.request.uri.path contains \"/tenant1\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "tenant2.erfi.tech"
      origin {
        host = "tenant2.erfi.tech"
      }
    }
    description = "Origin - erfi.tech"
    enabled     = true
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/tenant2\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "httpbun.${var.domain_name}"
    }
    description = "Origin - httpbun.${var.domain_name}"
    enabled     = true
    expression  = "(http.host eq \"custom-hostname.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      host_header = "storage.googleapis.com"
    }
    description = "Origin - storage.googleapis.com"
    enabled     = true
    expression  = "(http.host eq \"gcs.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      origin {
        port = 9000
      }
    }
    description = "httpbun on erfipie"
    enabled     = true
    expression  = "(http.host eq \"httpbun-pie.${var.domain_name}\")"
  }
  rules {
    action = "route"
    action_parameters {
      origin {
        port = 5001
      }
    }
    description = "dockge on arch0"
    enabled     = true
    expression  = "(http.host eq \"dockge-nl.${var.domain_name}\")"
  }
}
