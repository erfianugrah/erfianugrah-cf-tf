resource "cloudflare_ruleset" "http_config_settings" {
  kind    = "zone"
  name    = "default"
  phase   = "http_config_settings"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "set_config"
    action_parameters {
      autominify {
        css  = false
        html = false
        js   = false
      }
      bic                = false
      disable_zaraz      = true
      email_obfuscation  = false
      hotlink_protection = false
      mirage             = false
      polish             = "off"
      rocket_loader      = false
    }
    description = "Astro Blog"
    enabled     = true
    expression  = "(http.host in {\"www.${var.domain_name}\" \"${var.domain_name}\"})"

  }
  rules {
    action = "set_config"
    action_parameters {
      autominify {
        css  = false
        html = false
        js   = false
      }
    }
    description = "Minify Off"
    enabled     = true
    expression  = "(http.host in {\"httpbun.${var.domain_name}\" \"pastebin.${var.domain_name}\" \"httpbin.${var.domain_name}\" \"immich.${var.domain_name}\"})"
  }
  rules {
    action = "set_config"
    action_parameters {
      rocket_loader = false
    }
    description = "Rocketloader Off"
    enabled     = true
    expression  = "(http.host in {\"pihole.${var.domain_name}\" \"kvm.${var.domain_name}\" \"servarr.${var.domain_name}\" \"httpbun.${var.domain_name}\" \"pastebin.${var.domain_name}\" \"immich.${var.domain_name}\" \"radarr.${var.domain_name}\" \"ihatemoney.${var.domain_name}\" \"authentik.${var.domain_name}\" \"qbit.${var.domain_name}\" \"quantum.${var.domain_name}\"})"
  }
  rules {
    action = "set_config"
    action_parameters {
      polish = "off"
    }
    description = "Polish Off"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/content/images\")"
  }
  # Removed: Router (home) — no active DNS
  rules {
    action = "set_config"
    action_parameters {
      disable_zaraz = true
    }
    description = "Zaraz Off"
    enabled     = true
    expression  = "(http.host in {\"immich.${var.domain_name}\" \"file.${var.domain_name}\"})"
  }
  rules {
    action = "set_config"
    action_parameters {
      ssl = "full"
    }
    description = "SSL: FULL"
    enabled     = false
    expression  = "(http.host in {\"kvm-nl.${var.domain_name}\"})"
  }
  rules {
    action = "set_config"
    action_parameters {
      ssl = "full"
    }
    description = "tpi Full Setting"
    enabled     = false
    expression  = "(http.host eq \"tpi.${var.domain_name}\")"
  }
  rules {
    action = "set_config"
    action_parameters {
      ssl = "flexible"
    }
    description = "Flexible SSL"
    enabled     = true
    expression  = "(http.host in {\"httpbun-pie.${var.domain_name}\" \"httpbun-arch0.${var.domain_name}\" \"dockge-nl.${var.domain_name}\"  })"
  }
}

