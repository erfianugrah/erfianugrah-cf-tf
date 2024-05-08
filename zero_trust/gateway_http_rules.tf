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
