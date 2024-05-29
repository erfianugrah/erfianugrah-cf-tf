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

# resource "cloudflare_teams_rule" "servarr_net" {
#   account_id  = var.cloudflare_account_id
#   name        = "Servarr VNET"
#   description = ""
#   precedence  = 4500
#   action      = "allow"
#   filters     = ["l4"]
#   enabled     = false
#   traffic     = "net.vnet_id == \"72c08af0-de51-4d98-8a00-1b1e0a9756b1\""
#   rule_settings {
#     block_page_enabled                 = false
#     ip_categories                      = false
#     insecure_disable_dnssec_validation = false
#     check_session {
#       enforce  = false
#       duration = 0
#     }
#     biso_admin_controls {
#       disable_copy_paste = false
#       disable_download   = false
#       disable_keyboard   = false
#       disable_printing   = false
#       disable_upload     = false
#     }
#   }
# }

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

resource "cloudflare_teams_rule" "block_httpbun" {
  account_id  = var.cloudflare_account_id
  name        = "Block HTTPBun"
  description = ""
  precedence  = 6000
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.dst.ip == 172.18.0.8"
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

resource "cloudflare_teams_rule" "block_k3s_revista" {
  account_id  = var.cloudflare_account_id
  name        = "Block k3s Revista Blog"
  description = ""
  precedence  = 10000
  action      = "block"
  filters     = ["l4"]
  enabled     = false
  traffic     = "net.dst.ip == 10.43.55.115 and net.dst.port == 4321 and net.src.ip == 8.29.231.208"
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
  precedence  = 10000772
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
