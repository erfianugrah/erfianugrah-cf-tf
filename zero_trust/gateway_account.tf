resource "cloudflare_teams_account" "miau" {
  account_id                             = var.cloudflare_account_id
  tls_decrypt_enabled                    = true
  protocol_detection_enabled             = true
  activity_log_enabled                   = true
  non_identity_browser_isolation_enabled = false

  # block_page {
  #   enabled          = true
  #   footer_text      = "Erfi Corp"
  #   header_text      = "Access is denied."
  #   logo_path        = "https://www.${var.domain_name}/_astro/ea_favicon_Z6SwqA.avif"
  #   background_color = "#000000"
  #   mailto_address   = var.cloudflare_email
  #   mailto_subject   = "Your access was denied."
  # }

  body_scanning {
    inspection_mode = "deep"
  }

  antivirus {
    enabled_download_phase = false
    enabled_upload_phase   = false
    fail_closed            = false
  }

  fips {
    tls = false
  }

  proxy {
    tcp        = true
    udp        = true
    root_ca    = true
    virtual_ip = true
  }

  url_browser_isolation_enabled = true

  logging {
    redact_pii = false
    settings_by_rule_type {
      dns {
        log_all    = true
        log_blocks = false
      }
      http {
        log_all    = true
        log_blocks = false
      }
      l4 {
        log_all    = true
        log_blocks = false
      }
    }
  }

  extended_email_matching {
    enabled = true
  }

  ssh_session_log {
    public_key = var.ssh_log_public_key
  }
}
