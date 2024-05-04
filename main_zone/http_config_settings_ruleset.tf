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
      disable_apps       = true
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
    expression  = "(http.host in {\"hedgedoc.${var.domain_name}\" \"httpbun.${var.domain_name}\" \"pastebin.${var.domain_name}\" \"home.${var.domain_name}\" \"httpbin.${var.domain_name}\" \"grafana-unraid.${var.domain_name}\" \"privatebin.${var.domain_name}\" \"immich.${var.domain_name}\" \"cdn.${var.domain_name}\"})"
  }
  rules {
    action = "set_config"
    action_parameters {
      rocket_loader = false
    }
    description = "Rocketloader Off"
    enabled     = true
    expression  = "(http.host in {\"git.${var.domain_name}\" \"pihole.${var.domain_name}\" \"kvm.${var.domain_name}\" \"plex.${var.domain_name}\" \"dillinger.${var.domain_name}\" \"hedgedoc.${var.domain_name}\" \"servarr.${var.domain_name}\" \"httpbun.${var.domain_name}\" \"pastebin.${var.domain_name}\" \"home.${var.domain_name}\" \"privatebin.${var.domain_name}\" \"immich.${var.domain_name}\" \"cdn.${var.domain_name}\" \"radarr.${var.domain_name}\" \"ihatemoney.${var.domain_name}\"})"
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
  rules {
    action = "set_config"
    action_parameters {
      autominify {
        css  = false
        html = false
        js   = false
      }
      bic                = false
      disable_apps       = true
      disable_railgun    = true
      disable_zaraz      = true
      email_obfuscation  = false
      hotlink_protection = false
      mirage             = false
      polish             = "off"
      rocket_loader      = false
      ssl                = "full"
    }
    description = "Router"
    enabled     = true
    expression  = "(http.host contains \"home.${var.domain_name}\")"
  }
  rules {
    action = "set_config"
    action_parameters {
      disable_zaraz = true
    }
    description = "Zaraz Off"
    enabled     = true
    expression  = "(http.host in {\"privatebin.${var.domain_name}\" \"photoprism.${var.domain_name}\" \"immich.${var.domain_name}\"})"
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
}