resource "cloudflare_ruleset" "http_request_firewall_custom" {
  kind    = "zone"
  name    = "Default"
  phase   = "http_request_firewall_custom"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "skip"
    action_parameters {
      phases   = ["http_request_firewall_managed", "http_request_sbfm"]
      products = ["zoneLockdown", "uaBlock", "bic", "hot", "rateLimit", "waf"]
      ruleset  = "current"
    }
    description = "195.240.81.42"
    enabled     = true
    expression  = "(ip.src eq 195.240.81.42)"
    logging {
      enabled = true
    }
  } 
  rules {
    action      = "managed_challenge"
    description = "WAF Attack Score < 10"
    enabled     = true
    expression  = "(cf.waf.score lt 10)"
  }
  rules {
    action      = "js_challenge"
    description = "Test IUAM"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\")"
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
  # rules {
  #   action      = "block"
  #   description = "mTLS privatebin"
  #   enabled     = false
  #   expression  = "(http.host eq \"privatebin.${var.domain_name}\" and not cf.tls_client_auth.cert_verified)"
  # }
  rules {
    action      = "block"
    description = "Block HTTP"
    enabled     = true 
    expression  = "(not ssl)"
  }
  rules {
    action = "block"
    action_parameters {
      response {
        content      = "More than 8"
        content_type = "application/json"
        status_code  = 403
      }
    }
    description = "Test Form Length Block"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/post\" and any(len(http.request.body.form[\"password\"][*])[*] > 8))"
  }
  rules {
    action      = "log"
    description = "Logging"
    enabled     = true
    expression  = "(http.host contains \"${var.domain_name}\")"
  }
  rules {
    action      = "block"
    description = "Block Test ne erfi"
    enabled     = false
    expression  = "(all(http.request.headers[\"test\"][*] ne \"erfi\") and http.host eq \"httpbun.${var.domain_name}\" and http.request.uri.path contains \"/headers\")"
  }
  # rules {
  #   action = "block"
  #   action_parameters {
  #     response {
  #       content      = "{ You are a heretic }"
  #       content_type = "application/json"
  #       status_code  = 403
  #     }
  #   }
  #   description = "mTLS-enforced authentication [httpbin]"
  #   enabled     = false
  #   expression  = "(http.request.uri.path in {\"/headers\"} and http.host in {\"httpbin.${var.domain_name}\" \"httpbun.${var.domain_name}\"} and not cf.tls_client_auth.cert_verified and cf.tls_client_auth.cert_fingerprint_sha256 ne \"62e373d7a8f356f2b59bfbe8f48f876e1eb1393abc598775a20e416cd7ee05f7\")"
  # }
  rules {
    action = "block"
    action_parameters {
      response {
        content      = "{mm}"
        content_type = "application/json"
        status_code  = 403
      }
    }
    description = "Block All"
    enabled     = false
    expression  = "(ip.src in {0.0.0.0/0}) or (ip.src in {::/0})"
  }
  rules {
    action      = "log"
    description = "Log Muses"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"muses\")"
  }
  rules {
    action = "skip"
    action_parameters {
      phases   = ["http_ratelimit", "http_request_firewall_managed", "http_request_sbfm"]
      products = ["waf", "uaBlock", "zoneLockdown", "bic", "hot", "securityLevel", "rateLimit"]
      ruleset  = "current"
    }
    description = "Bypass Erfi"
    enabled     = false
    expression  = "(ip.src in $erfi_ips)"
    logging {
      enabled = true
    }
  }
  rules {
    action = "block"
    action_parameters {
      response {
        content      = "{mlem}"
        content_type = "application/json"
        status_code  = 403
      }
    }
    description = "Test Regex"
    enabled     = false
    expression  = "(http.request.body.raw matches \"(?i)sensor_data$\")"
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
    expression  = "(ip.src eq 118.189.189.102 and cf.bot_management.ja3_hash eq \"d75e7289c86c15b305ac36097bfa0487\")"
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
    expression  = "(ip.src eq 118.189.189.102 and cf.bot_management.ja3_hash eq \"2a18e6bf307f97c5e27f0ab407dc65db\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Portainer Edge Agent API"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"6cea5fe04d7df57d267a389bafc5f00e\") or (cf.bot_management.ja3_hash eq \"3d7bf89cc161a903b3410961d44c1b8c\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Gitea JA3"
    enabled     = true
    expression  = "(cf.bot_management.ja3_hash eq \"8662467bc96db2d387755570446a7946\") or (cf.bot_management.ja3_hash eq \"398430069e0a8ecfbc8db0778d658d77\") or (cf.bot_management.ja3_hash eq \"5106c6656cd3f4481b691eb4158652e9\")"
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
    expression  = "(cf.bot_management.ja3_hash eq \"579ccef312d18482fc42e2b822ca2430\") or (cf.bot_management.ja3_hash eq \"2de42bb701d689176cd3487a44aaccab\") or (cf.bot_management.ja3_hash eq \"1d55c8e5c3de404f53b22d49c96a475a\") or (cf.bot_management.ja3_hash eq \"b719940c5ab9a3373cb4475d8143ff88\") or (cf.bot_management.ja3_hash eq \"579ccef312d18482fc42e2b822ca2430\") or (cf.bot_management.ja3_hash eq \"44d502d471cfdb99c59bdfb0f220e5a8\") or (cf.bot_management.ja3_hash eq \"579ccef312d18482fc42e2b822ca2430\") or (cf.bot_management.ja3_hash eq \"8436bef32bfb40c2379ecbbbbd07ee7b\") or (cf.bot_management.ja3_hash eq \"b719940c5ab9a3373cb4475d8143ff88\") or (cf.bot_management.ja3_hash eq \"8436bef32bfb40c2379ecbbbbd07ee7b\") or (cf.bot_management.ja3_hash eq \"02aa4679df284f240695da144b70c288\") or (cf.bot_management.ja3_hash eq \"57fbe0aefee44901190849b0e877a5e1\") or (cf.bot_management.ja3_hash eq \"41cb1a264f27be250a6575f4c9aba2f1\") or (cf.bot_management.ja3_hash eq \"9c815150ea821166faecf80757d8826a\") or (cf.bot_management.ja3_hash eq \"40adfd923eb82b89d8836ba37a19bca1\") or (cf.bot_management.ja3_hash eq \"c199b43d41b470f8f68c5561f8f1ce3e\") or (cf.bot_management.ja3_hash eq \"86cb13d6bbb3ac96b78b408bcfc18794\") or (cf.bot_management.ja3_hash eq \"3fed133de60c35724739b913924b6c24\") or (cf.bot_management.ja3_hash eq \"473cd7cb9faa642487833865d516e578\") or (cf.bot_management.ja3_hash eq \"485ec531c406824f09c63ecd72885340\") or (cf.bot_management.ja3_hash eq \"f436b9416f37d134cadd04886327d3e8\") or (cf.bot_management.ja3_hash eq \"931fd3557888d45b4d1574380e2b1ed8\") or (cf.bot_management.ja3_hash eq \"e4d448cdfe06dc1243c1eb026c74ac9a\") or (cf.bot_management.ja3_hash eq \"8d9f7747675e24454cd9b7ed35c58707\") or (cf.bot_management.ja3_hash eq \"473cd7cb9faa642487833865d516e578\") or (cf.bot_management.ja3_hash eq \"f79b6bad2ad0641e1921aef10262856b\") or (cf.bot_management.ja3_hash eq \"53d3d68430f4567b72d3e91fa8ce82f3\") or (cf.bot_management.ja3_hash eq \"15edee9ddf63a0941a98c4bc50eb02be\") or (cf.bot_management.ja3_hash eq \"1e2dd7855fb304ab4085b91d57b19c5d\") or (cf.bot_management.ja3_hash eq \"3a3a7739b7ee9b4dc9078b116b72ab96\") or (cf.bot_management.ja3_hash eq \"53e24c8e301bf0333436e88263c8f077\") or (cf.bot_management.ja3_hash eq \"1aec235ec8dd0322c68d253a863b5eed\") or (cf.bot_management.ja3_hash eq \"c9e756f0d1d7f395f835b0b3d734b98c\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Synapse Delegation/Federation"
    enabled     = true
    expression  = "(http.host eq \"synapse.${var.domain_name}\" and http.request.uri.path contains \"/.well-known\") or (http.host eq \"synapse.${var.domain_name}\" and http.request.uri.path contains \"/_matrix/federation\") or (http.host eq \"synapse.${var.domain_name}\" and http.request.uri.path contains \"/_matrix/key\") or (http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/_matrix/key\") or (http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/_matrix/federation\") or (http.host eq \"${var.domain_name}\" and http.request.uri.path contains \"/.well-known\")"
    logging {
      enabled = true
    }
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow Plex"
    enabled     = true
    expression  = "(http.host eq \"plex.${var.domain_name}\") or (http.host eq \"plex.${var.domain_name}:443\")"
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
    action      = "managed_challenge"
    description = "Bot < 5"
    enabled     = false
    expression  = "(cf.bot_management.score lt 5 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource)"
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
    action      = "block"
    description = "Port Block"
    enabled     = false
    expression  = "(not cf.edge.server_port in {2053 2082 2083 2096 8080} and http.host eq \"${var.domain_name}\")"
  }
  rules {
    action      = "block"
    description = "Test Request Header"
    enabled     = false
    expression  = "any(http.request.headers[\"erfi\"][*] == \"Best\")"
  }
  rules {
    action      = "block"
    description = "HASHDoS"
    enabled     = false
    expression  = "(http.request.method eq \"POST\" and http.request.body.form.names[40] ne \"\")"
  }
  rules {
    action      = "block"
    description = "cookie block"
    enabled     = false
    expression  = "http.request.headers[\"cookie\"][1] ne \"\""
  }
  rules {
    action      = "block"
    description = "header block"
    enabled     = false
    expression  = "http.request.headers.names[5] ne \"\""
  }
  rules {
    action      = "block"
    description = "method, version, url length"
    enabled     = false
    expression  = "len(http.request.method) lt 4096"
  }
  rules {
    action      = "log"
    description = "Blep"
    enabled     = false
    expression  = "(http.host eq \"blep.com\")"
  }
  rules {
    action      = "log"
    description = "Test_springshield"
    enabled     = false
    expression  = "(http.request.uri.query contains \"class.module.classLoader.resources.context.parent.pipeline.first.pattern=%25%7Bxyz%7Di%20class.module.classLoader.resources.context.parent.pipeline.first.suffix=.jsp%20class.module.classLoader.resources.context.parent.pipeline.first.directory=%7Bdir%7D%20class.module.classLoader.resources.context.parent.pipeline.first.prefix=%7Bfile%7D%20class.module.classLoader.resources.context.parent.pipeline.first.fileDateFormat=123\")"
  }
  rules {
    action      = "log"
    description = "JPG test"
    enabled     = false
    expression  = "(http.request.uri matches \".png\")"
  }
  rules {
    action      = "block"
    description = "form names"
    enabled     = false
    expression  = "len(http.request.uri.args.names) > 64"
  }
  rules {
    action      = "managed_challenge"
    description = "Test"
    enabled     = false
    expression  = "(http.request.uri.path matches \"^.*\\\\/(api|rest|oidc|v1)\" and not ip.geoip.country in {\"SG\" \"MY\"})"
  }
  rules {
    action      = "block"
    description = "HMAC 2"
    enabled     = false
    expression  = "(http.host matches \"hmac.${var.domain_name}$\" and http.request.uri matches \"^/very/secure/documents/.*\" and not is_timed_hmac_valid_v0(\"verysafe\", concat(http.request.uri, http.request.headers[\"hmac\"][0]), 180, http.request.timestamp.sec))"
  }
  rules {
    action      = "block"
    description = "Request Body Multipart"
    enabled     = false
    expression  = "(any(url_decode(http.request.body.multipart.names[*][*],\"u\")[*] ~ \"<.*?>\"))"
  }
  rules {
    action      = "block"
    description = "Cookie Test"
    enabled     = false
    expression  = "any(http.request.cookies[\"app\"][*] == \"test\")"
  }
  # rules {
  #   action      = "block"
  #   description = "MTLS Test"
  #   enabled     = false
  #   expression  = "(http.host in {\"prometheus-pie.${var.domain_name}\"} and not cf.tls_client_auth.cert_verified)"
  # }
  rules {
    action      = "block"
    description = "header block test"
    enabled     = false
    expression  = "(http.request.uri.path contains \"/mlem\" and any(len(http.request.headers[*])[*] > 10))"
  }
  rules {
    action      = "block"
    description = "Header length test"
    enabled     = false
    expression  = "(http.request.uri.path contains \"/mlem\" and len(concat(http.request.headers.names, http.request.headers.values)) > 10)"
  }
  rules {
    action      = "block"
    description = "duplicate form values"
    enabled     = false
    expression  = "http.request.body.form[\"content-type\"][1] == \"text/html\" and http.request.body.form[\"content-disposition\"][1] == \"multipart/form-data\""
  }
  rules {
    action      = "block"
    description = "HMAC"
    enabled     = false
    expression  = "(http.host eq \"${var.domain_name}\" and http.request.uri.path matches \"wp-content/uploads/\" and not is_timed_hmac_valid_v0(\"password\", http.request.uri, 30, http.request.timestamp.sec, 8))"
  }
  rules {
    action = "block"
    action_parameters {
      response {
        content      = "ar/.stgmkaeigmvkrsateigmkarioegmkario"
        content_type = "application/json"
        status_code  = 403
      }
    }
    description = "test"
    enabled     = false
    expression  = "(http.host eq \"tiago.${var.domain_name}\" and ip.src in {2001:818:e754:5000:d4a8:174d:55f9:9477 94.60.171.76  195.240.81.42})"
  }
  rules {
    action      = "log"
    description = "JavaScript Verified URLs [Template]"
    enabled     = true
    expression  = "(not cf.bot_management.js_detection.passed and http.request.method eq \"\" and http.request.uri.path in {\"\"})"
  }
  rules {
    action      = "log"
    description = "test"
    enabled     = false
    expression  = "(http.host in {\"${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\"\"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\" \"www.${var.domain_name}\"})"
  }
  rules {
    action      = "block"
    description = "Block Serial"
    enabled     = false
    expression  = "cf.tls_client_auth.cert_serial eq \"64fa3632ad0854e6356ab5d8549bc0b6ab9be941\""
  }
}
