resource "cloudflare_teams_rule" "self_signed_httpbun" {
  account_id  = var.cloudflare_account_id
  name        = "Self-signed HTTPbun"
  description = ""
  precedence  = 1
  action      = "off"
  filters     = ["http"]
  enabled     = false
  traffic     = "http.conn.hostname == \"self-signed-cert.httpbun.com\""
  rule_settings {
    block_page_enabled                 = true
    block_page_reason                  = "access not permitted"
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "isolate_fb" {
  account_id  = var.cloudflare_account_id
  name        = "Isolate FB"
  description = ""
  precedence  = 250
  action      = "isolate"
  filters     = ["http"]
  enabled     = false
  traffic     = "http.request.host == \"facebook.com\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = true
      disable_download   = true
      disable_keyboard   = true
      disable_printing   = true
      disable_upload     = true
    }
  }
}

resource "cloudflare_teams_rule" "block_fb" {
  account_id  = var.cloudflare_account_id
  name        = "Block HTTP FB"
  description = ""
  precedence  = 500
  action      = "block"
  filters     = ["http"]
  enabled     = false
  traffic     = "any(http.request.domains[*] in {\"facebook.com\"})"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "cert_pinning" {
  account_id  = var.cloudflare_account_id
  name        = "Cert Pinning"
  description = ""
  precedence  = 750
  action      = "off"
  filters     = ["http"]
  enabled     = false
  traffic     = "any(app.ids[*] in {541})"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_ig" {
  account_id  = var.cloudflare_account_id
  name        = "Block Instagram"
  description = ""
  precedence  = 1000
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.dst.ip == 157.240.235.174"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_ftp" {
  account_id  = var.cloudflare_account_id
  name        = "Block FTP"
  description = ""
  precedence  = 1250
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.dst.port == 21"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "allow_ig_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Allow IG DNS"
  description = ""
  precedence  = 1500
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "dns.fqdn == \"www.instagram.com\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_all_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Allow All DNS"
  description = ""
  precedence  = 2000
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "any(dns.domains[*] matches \".*\")"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_all_sni" {
  account_id  = var.cloudflare_account_id
  name        = "Block All SNI"
  description = ""
  precedence  = 2500
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "any(net.sni.domains[*] matches \".*\")"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_sec_categories_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Security Categories"
  description = ""
  precedence  = 3000
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "any(dns.security_category[*] in {68 80 83 176 175 117 169 177 131 134 151 153})"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "portainer_dns_override" {
  account_id  = var.cloudflare_account_id
  name        = "DNS Override Portainer"
  description = ""
  precedence  = 3500
  action      = "override"
  filters     = ["dns"]
  enabled     = false
  traffic     = "dns.fqdn == \"vm.erfianugrah.com\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    override_ips                       = ["172.17.0.2"]
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "office_365_generated" {
  account_id  = var.cloudflare_account_id
  name        = "Office 365 Auto Generated"
  description = "Bypass HTTPS decryption of Office 365 traffic"
  precedence  = 4000
  action      = "off"
  filters     = ["http"]
  enabled     = false
  traffic     = "any(app.ids[*] in {626 594 635 514 601 596 597 680})"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "servarr_net" {
  account_id  = var.cloudflare_account_id
  name        = "Servarr VNET"
  description = ""
  precedence  = 4500
  action      = "allow"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.vnet_id == \"72c08af0-de51-4d98-8a00-1b1e0a9756b1\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    check_session {
      enforce  = false
      duration = 0
    }
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "ssh_logging" {
  account_id  = var.cloudflare_account_id
  name        = "SSH Audit"
  description = ""
  precedence  = 5000
  action      = "audit_ssh"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.dst.ip == 10.68.69.7"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    audit_ssh {
      command_logging = true
    }
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "isolate_root" {
  account_id  = var.cloudflare_account_id
  name        = "Isolate erfianugrah.com"
  description = ""
  precedence  = 5500
  action      = "isolate"
  filters     = ["http"]
  enabled     = false
  traffic     = "any(http.request.domains[*] == \"erfianugrah.com\")"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_everything" {
  account_id  = var.cloudflare_account_id
  name        = "Block Everything"
  description = ""
  precedence  = 10000
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.protocol == \"tcp\" or net.protocol == \"udp\""
  identity    = "identity.email == \"${var.cloudflare_email}\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}
