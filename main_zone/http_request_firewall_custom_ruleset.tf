resource "cloudflare_ruleset" "http_request_firewall_custom" {
  kind    = "zone"
  name    = "Default"
  phase   = "http_request_firewall_custom"
  zone_id = var.cloudflare_zone_id
  rules {
    action      = "log"
    description = "Log All"
    enabled     = true
    expression  = "(http.host contains \"${var.domain_name}\")"
  }
  rules {
    action = "skip"
    action_parameters {
      phases   = ["http_request_firewall_managed", "http_request_sbfm"]
      products = ["zoneLockdown", "uaBlock", "bic", "hot", "rateLimit", "waf"]
      ruleset  = "current"
    }
    description = "KPN IP and Mobile Client"
    enabled     = true
    expression  = "(ip.src in { ${var.nl_ip} ${var.nl_ipv6} } or cf.bot_management.ja4 in {\"t13d171200_5b57614c22b0_f0527480ae2d\" \"t13d171100_5b57614c22b0_3f5d972527c0\"})"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      phases   = ["http_request_firewall_managed", "http_request_sbfm"]
      products = ["zoneLockdown", "uaBlock", "bic", "hot", "rateLimit", "waf"]
      ruleset  = "current"
    }
    description = "Skip Github Actions for Revista Build"
    enabled     = true
    expression  = "(http.host contains \"cdn.${var.domain_name}\" and cf.bot_management.ja4 in {\"t13d5911h1_a33745022dd6_1f22a2ca17c4\" \"t13d5912h1_a33745022dd6_dbd39dd1d406\"})"
    logging {
      enabled = true
    }
  }
  rules {
    action      = "log"
    description = "Log Bot Score <= 5"
    enabled     = true
    expression  = "(cf.bot_management.score le 5 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not ip.src in {${var.sg_ip} ${var.nl_ip}})"
  }
  rules {
    action      = "managed_challenge"
    description = "WAF Attack Score <= 10"
    enabled     = true
    expression  = "(cf.waf.score le 10)"
  }
  rules {
    action = "skip"
    action_parameters {
      phases   = ["http_ratelimit", "http_request_firewall_managed", "http_request_sbfm"]
      products = ["zoneLockdown", "uaBlock", "bic", "hot", "securityLevel", "rateLimit", "waf"]
      ruleset  = "current"
    }
    description = "Load-testing"
    enabled     = true
    expression  = "(http.user_agent contains \"loader.io;f51eef0b3b3248f4502c43adb418a742\") or (http.user_agent contains \"k6/0.47.0 (https://k6.io/)\")"
    logging {
      enabled = true
    }
  }
  rules {
    action      = "block"
    description = "Block HTTP"
    enabled     = true
    expression  = "(not ssl)"
  }
  rules {
    action      = "managed_challenge"
    description = "Apache Log4J2"
    enabled     = true
    expression  = "any(http.request.headers.values[*] ~ \"\\$\\{jndi:ldap.*\\}\") || http.request.body.raw ~ \"\\$\\{jndi:ldap.*\\}\""
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "GSSG Allow"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"fb4726d465c5f28b84cd6d14cedd13a7\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow HASS"
    enabled     = true
    expression  = "(ip.src eq ${var.sg_ip} and cf.bot_management.ja3_hash eq \"d75e7289c86c15b305ac36097bfa0487\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow ASUS Router"
    enabled     = true
    expression  = "(ip.src eq ${var.sg_ip} and cf.bot_management.ja3_hash eq \"2a18e6bf307f97c5e27f0ab407dc65db\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow OIDC Token"
    enabled     = true
    expression  = "(http.request.uri.path contains \"/auth/realms/unkers/protocol/openid-connect/token\" and http.host eq \"keycloak.${var.domain_name}\") or (http.host eq \"keycloak.${var.domain_name}\" and http.request.uri.path contains \"/auth/realms/unkers/protocol/openid-connect/certs\") or (http.host eq \"keycloak.${var.domain_name}\" and http.request.uri.path contains \"/auth/realms/unkers/protocol/openid-connect/auth\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow ZeroSSL JA3"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"1f24dbdea9cbd448a034e5d87c14168f\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Joplin"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"4d61c917a3225da2223d1955dc719e5d\") or (cf.bot_management.ja3_hash eq \"080027e640f8ec6d966f79fc2f7ca551\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Servarr JA3"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"02aa4679df284f240695da144b70c288\") or (cf.bot_management.ja3_hash eq \"15edee9ddf63a0941a98c4bc50eb02be\") or (cf.bot_management.ja3_hash eq \"1aec235ec8dd0322c68d253a863b5eed\") or (cf.bot_management.ja3_hash eq \"1d55c8e5c3de404f53b22d49c96a475a\") or (cf.bot_management.ja3_hash eq \"1e2dd7855fb304ab4085b91d57b19c5d\") or (cf.bot_management.ja3_hash eq \"2de42bb701d689176cd3487a44aaccab\") or (cf.bot_management.ja3_hash eq \"3a3a7739b7ee9b4dc9078b116b72ab96\") or (cf.bot_management.ja3_hash eq \"3fed133de60c35724739b913924b6c24\") or (cf.bot_management.ja3_hash eq \"40adfd923eb82b89d8836ba37a19bca1\") or (cf.bot_management.ja3_hash eq \"41cb1a264f27be250a6575f4c9aba2f1\") or (cf.bot_management.ja3_hash eq \"44d502d471cfdb99c59bdfb0f220e5a8\") or (cf.bot_management.ja3_hash eq \"473cd7cb9faa642487833865d516e578\") or (cf.bot_management.ja3_hash eq \"485ec531c406824f09c63ecd72885340\") or (cf.bot_management.ja3_hash eq \"53d3d68430f4567b72d3e91fa8ce82f3\") or (cf.bot_management.ja3_hash eq \"53e24c8e301bf0333436e88263c8f077\") or (cf.bot_management.ja3_hash eq \"579ccef312d18482fc42e2b822ca2430\") or (cf.bot_management.ja3_hash eq \"57fbe0aefee44901190849b0e877a5e1\") or (cf.bot_management.ja3_hash eq \"8436bef32bfb40c2379ecbbbbd07ee7b\") or (cf.bot_management.ja3_hash eq \"86cb13d6bbb3ac96b78b408bcfc18794\") or (cf.bot_management.ja3_hash eq \"8d9f7747675e24454cd9b7ed35c58707\") or (cf.bot_management.ja3_hash eq \"931fd3557888d45b4d1574380e2b1ed8\") or (cf.bot_management.ja3_hash eq \"9c815150ea821166faecf80757d8826a\") or (cf.bot_management.ja3_hash eq \"b719940c5ab9a3373cb4475d8143ff88\") or (cf.bot_management.ja3_hash eq \"c199b43d41b470f8f68c5561f8f1ce3e\") or (cf.bot_management.ja3_hash eq \"c9e756f0d1d7f395f835b0b3d734b98c\") or (cf.bot_management.ja3_hash eq \"e4d448cdfe06dc1243c1eb026c74ac9a\") or (cf.bot_management.ja3_hash eq \"f436b9416f37d134cadd04886327d3e8\") or (cf.bot_management.ja3_hash eq \"f79b1b0152a23b1044ac8d89c2587dde\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Erfi IPs"
    enabled     = true
    expression  = "(ip.src in $erfi_ips)"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow KVM"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"ad843492eb8f8d6d024cb721dc64c4d1\")"
    logging {
      enabled = true
    }
  }
  rules {
    action      = "log"
    description = "JavaScript Verified URLs [Template]"
    enabled     = true
    expression  = "(not cf.bot_management.js_detection.passed and http.request.method eq \"\" and http.request.uri.path in {\"\"})"
  }
}
