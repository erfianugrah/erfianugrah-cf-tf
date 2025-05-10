resource "cloudflare_zero_trust_access_policy" "allow_erfi" {
  # application_id   = cloudflare_zero_trust_access_application.kvm.id
  account_id = var.cloudflare_account_id
  name       = "Allow Erfi"
  # precedence       = "1"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_zero_trust_access_group.erfi_corp.id]
  }
}

resource "cloudflare_zero_trust_access_policy" "warp_auth_token" {
  # application_id   = cloudflare_zero_trust_access_application.prometheus.id
  account_id = var.cloudflare_account_id
  name       = "warp_auth_token"
  # precedence       = "2"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.warp_auth_token.id]
  }
}
# resource "cloudflare_zero_trust_access_policy" "allow_erfi_privatebin" {
#   application_id   = cloudflare_zero_trust_access_application.privatebin.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
#
#   approval_group {
#     approvals_needed = 1
#     email_addresses  = [var.cloudflare_email]
#   }
# }

resource "cloudflare_zero_trust_access_policy" "allow_unker" {
  # application_id   = cloudflare_zero_trust_access_application.privatebin.id
  account_id = var.cloudflare_account_id
  name       = "Allow Unker"
  # precedence       = "2"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_zero_trust_access_group.unker.id]
  }

  # approval_group {
  #   approvals_needed = 1
  #   email_addresses  = [var.cloudflare_email]
  # }
}

resource "cloudflare_zero_trust_access_policy" "allow_cf" {
  # application_id   = cloudflare_zero_trust_access_application.privatebin.id
  account_id = var.cloudflare_account_id
  name       = "Allow Cloudflare"
  # precedence       = "3"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_zero_trust_access_group.cf_corp.id]
  }

  # approval_group {
  #   approvals_needed = 1
  #   email_addresses  = [var.cloudflare_email]
  # }
}

# resource "cloudflare_zero_trust_access_policy" "traefik_dash" {
#   application_id   = cloudflare_zero_trust_access_application.traefik_dash.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "erfipie_ssh" {
#   application_id   = cloudflare_zero_trust_access_application.erfipie_ssh.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

# resource "cloudflare_zero_trust_access_policy" "vyos_ssh" {
#   application_id   = cloudflare_zero_trust_access_application.vyos_ssh.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "warp_login" {
#   application_id   = cloudflare_zero_trust_access_application.warp_login.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

resource "cloudflare_zero_trust_access_policy" "prometheus_auth_token" {
  # application_id   = cloudflare_zero_trust_access_application.prometheus.id
  account_id = var.cloudflare_account_id
  name       = "prometheus_unraid_token"
  # precedence       = "2"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.prometheus_token.id]
  }
}

# resource "cloudflare_zero_trust_access_policy" "prometheus_auth_erfi_corp" {
#   application_id   = cloudflare_zero_trust_access_application.prometheus.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "turing_pi_bmc" {
#   application_id   = cloudflare_zero_trust_access_application.turing_pi_bmc.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

# resource "cloudflare_zero_trust_access_policy" "google_saas" {
#   application_id   = cloudflare_zero_trust_access_application.google_saas.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "filebrowser_erfi_corp" {
#   application_id   = cloudflare_zero_trust_access_application.filebrowser.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

resource "cloudflare_zero_trust_access_policy" "allow_lena" {
  # application_id   = cloudflare_zero_trust_access_application.filebrowser.id
  account_id = var.cloudflare_account_id
  name       = "Allow Lena"
  # precedence       = "2"
  decision         = "allow"
  session_duration = "30m"

  include {
    email = var.lena_email
  }
}

resource "cloudflare_zero_trust_access_policy" "allow_oma" {
  # application_id   = cloudflare_zero_trust_access_application.filebrowser.id
  account_id = var.cloudflare_account_id
  name       = "Allow Oma"
  # precedence       = "2"
  decision         = "allow"
  session_duration = "30m"

  include {
    email = var.oma_email
  }
}
# resource "cloudflare_zero_trust_access_policy" "dillinger" {
#   application_id   = cloudflare_zero_trust_access_application.dillinger.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

resource "cloudflare_zero_trust_access_policy" "tunnel_secret_worker" {
  # application_id   = cloudflare_zero_trust_access_application.tunnel_secret_worker.id
  account_id = var.cloudflare_account_id
  name       = "tunnel_secret_worker_token"
  # precedence       = "1"
  decision         = "allow"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.tunnel_secret_worker_token.id]
  }
}

# resource "cloudflare_zero_trust_access_policy" "overseerr_erfi_corp" {
#   application_id   = cloudflare_zero_trust_access_application.overseerr.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

# resource "cloudflare_zero_trust_access_policy" "overseerr_lena" {
#   application_id   = cloudflare_zero_trust_access_application.overseerr.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Lena"
#   precedence       = "2"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     email = var.lena_email
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "overseerr_unker" {
#   application_id   = cloudflare_zero_trust_access_application.overseerr.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Unker"
#   precedence       = "3"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.unker.id]
#   }
# }

# resource "cloudflare_zero_trust_access_policy" "app_launcher" {
#   application_id   = cloudflare_zero_trust_access_application.app_launcher.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "synapse_admin" {
#   application_id   = cloudflare_zero_trust_access_application.synapse_admin.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }
#
# resource "cloudflare_zero_trust_access_policy" "servarr" {
#   application_id   = cloudflare_zero_trust_access_application.servarr.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }

resource "cloudflare_zero_trust_access_policy" "caddy_api_token" {
  # application_id   = cloudflare_zero_trust_access_application.caddy_api.id
  account_id = var.cloudflare_account_id
  name       = "caddy_api_token"
  # precedence       = "1"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.caddy_api_token.id]
  }
}

# resource "cloudflare_zero_trust_access_policy" "caddy_api_idp" {
#   application_id   = cloudflare_zero_trust_access_application.caddy_api.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "2"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# }


resource "cloudflare_zero_trust_access_policy" "ollama_token" {
  # application_id   = cloudflare_zero_trust_access_application.ollama.id
  account_id = var.cloudflare_account_id
  name       = "ollama_api"
  # precedence       = "1"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.ollama_token.id]
  }
}
#
# resource "cloudflare_zero_trust_access_policy" "changedetection" {
#   application_id   = cloudflare_zero_trust_access_application.changedetection.id
#   account_id       = var.cloudflare_account_id
#   name             = "Allow Erfi"
#   precedence       = "1"
#   decision         = "allow"
#   session_duration = "30m"
#
#   include {
#     group = [cloudflare_zero_trust_access_group.erfi_corp.id]
#   }
# 

resource "cloudflare_zero_trust_access_policy" "overseerr_token" {
  # application_id   = cloudflare_zero_trust_access_application.ollama.id
  account_id = var.cloudflare_account_id
  name       = "overseerr_api"
  # precedence       = "1"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_zero_trust_access_service_token.overseerr_token.id]
  }
}

resource "cloudflare_zero_trust_access_policy" "allow_interview" {
  # application_id   = cloudflare_zero_trust_access_application.privatebin.id
  account_id = var.cloudflare_account_id
  name       = "Allow Interview"
  # precedence       = "3"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_zero_trust_access_group.hadrian_corp.id]
  }

  # approval_group {
  #   approvals_needed = 1
  #   email_addresses  = [var.cloudflare_email]
}
