resource "cloudflare_zero_trust_access_application" "kvm" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "kvm.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = true
  name                       = "KVM"
  same_site_cookie_attribute = "lax"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "kvm.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allow_credentials = true
    allowed_origins   = [var.domain_name, "kvm.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "privatebin" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.allow_cf.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "privatebin.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = true
  name                       = "privatebin"
  same_site_cookie_attribute = "lax"
  service_auth_401_redirect  = true
  session_duration           = "30m"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "privatebin.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allow_credentials = true
    allowed_origins   = ["privatebin.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "traefik_dash" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "traefik-dashboard.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Traefik Dashboard"
  same_site_cookie_attribute = "none"
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "traefik-dashboard.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allow_credentials = true
    allowed_origins   = ["traefik-dashboard.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "erfipie_ssh" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "pie.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Pi"
  session_duration           = "24h"
  type                       = "ssh"
  destinations {
    type = "public"
    uri  = "pie.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "proxmox_ssh" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "*.proxmox.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Proxmox SSH"
  session_duration           = "24h"
  type                       = "ssh"
  destinations {
    type = "public"
    uri  = "*.proxmox.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "vyos_ssh" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "*.vyos.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "VyOS SSH"
  session_duration           = "24h"
  type                       = "ssh"
  destinations {
    type = "public"
    uri  = "*.vyos.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "warp_login" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.warp_auth_token.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  auto_redirect_to_identity = false
  domain                    = "erfianugrah.cloudflareaccess.com/warp"
  name                      = "Warp Login App"
  session_duration          = "24h"
  type                      = "warp"
}

resource "cloudflare_zero_trust_access_application" "prometheus" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.prometheus_auth_token.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "prom-unraid.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Prometheus"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "prom-unraid.${var.domain_name}"
  }
  destinations {
    type = "public"
    uri  = "prom-k3s.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "turing_pi_bmc" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "tpi.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Turing PI BMC UI"
  same_site_cookie_attribute = "none"
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "tpi.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allowed_origins   = ["tpi.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "google_saas" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.gmail.id]
  app_launcher_visible      = true
  auto_redirect_to_identity = false
  domain                    = var.google_domain
  name                      = "Google"
  session_duration          = "24h"
  type                      = "saas"
  saas_app {
    consumer_service_url = var.google_service_url
    name_id_format       = "email"
    sp_entity_id         = var.google_sp_id
  }
}

resource "cloudflare_zero_trust_access_application" "authentik_saas" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.allow_cf.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible      = true
  auto_redirect_to_identity = false
  domain                    = var.authentik_saas_domain
  name                      = "Authentik"
  session_duration          = "24h"
  type                      = "saas"
  saas_app {
    auth_type = "oidc"
    # public_key = var.authentik_saas_public_key
    # client_id     = var.authentik_saas_client_id
    redirect_uris = var.authentik_saas_redirect_uris
    grant_types   = ["authorization_code_with_pkce"]
    scopes        = ["openid", "email", "profile", "groups"]
  }
}

resource "cloudflare_zero_trust_access_application" "immich_saas" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible      = true
  auto_redirect_to_identity = false
  # domain                    = var.immich_saas_domain
  name             = "Immich"
  session_duration = "24h"
  type             = "saas"
  saas_app {
    auth_type = "oidc"
    # public_key = var.authentik_saas_public_key
    # client_id     = var.authentik_saas_client_id
    redirect_uris = var.immich_saas_redirect_uris
    grant_types   = ["authorization_code_with_pkce"]
    scopes        = ["openid", "email", "profile", "groups"]
  }
}

resource "cloudflare_zero_trust_access_application" "kubectl_saas" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.allow_cf.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible      = true
  auto_redirect_to_identity = false
  domain                    = "kubectl.${var.domain_name}"
  name                      = "kubectl"
  session_duration          = "24h"
  type                      = "saas"
  saas_app {
    auth_type = "oidc"
    # public_key = var.authentik_saas_public_key
    # client_id     = var.authentik_saas_client_id
    redirect_uris = ["http://localhost:8000", "http://127.0.0.1:8000", "http://localhost:18000", "http://127.0.0.1:18000", "urn:ietf:wg:oauth:2.0:oob"]
    # grant_types   = ["authorization_code_with_pkce"]
    scopes = ["openid", "email", "profile", "groups"]
  }
}

resource "cloudflare_zero_trust_access_application" "changedetection" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "change.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "ChangeDetection"
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "change.${var.domain_name}"
  }
}

# resource "cloudflare_zero_trust_access_application" "filebrowser" {
#   account_id = var.cloudflare_account_id
#   policies = [
#     cloudflare_zero_trust_access_policy.allow_erfi.id,
#     cloudflare_zero_trust_access_policy.allow_lena.id
#   ]
#   allowed_idps = [
#     cloudflare_zero_trust_access_identity_provider.entra_id.id,
#     cloudflare_zero_trust_access_identity_provider.google_workspace.id,
#     cloudflare_zero_trust_access_identity_provider.gmail.id,
#     cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
#     cloudflare_zero_trust_access_identity_provider.pin.id
#   ]
#   app_launcher_visible       = true
#   auto_redirect_to_identity  = false
#   domain                     = "file.${var.domain_name}/files"
#   enable_binding_cookie      = false
#   http_only_cookie_attribute = true
#   name                       = "File Browser"
#   same_site_cookie_attribute = "lax"
#   session_duration           = "15m"
#   type                       = "self_hosted"
#   destinations {
#     type = "public"
#     uri  = "file.${var.domain_name}/files"
#   }
#   cors_headers {
#     allow_all_headers = true
#     allow_all_methods = true
#     allow_credentials = true
#     allowed_origins   = [var.domain_name, "file.${var.domain_name}"]
#     max_age           = 3600
#   }
# }

resource "cloudflare_zero_trust_access_application" "dillinger" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "dillinger.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = true
  name                       = "Dillinger"
  same_site_cookie_attribute = "lax"
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "dillinger.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allow_credentials = true
    allowed_origins   = ["dillinger.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "tunnel_secret_worker" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.tunnel_secret_worker.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "tunnel.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = true
  name                       = "Tunnel Secret"
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "tunnel.${var.domain_name}"
  }
}

# resource "cloudflare_zero_trust_access_application" "overseerr" {
#   account_id = var.cloudflare_account_id
#   policies = [
#     cloudflare_zero_trust_access_policy.allow_erfi.id,
#     cloudflare_zero_trust_access_policy.allow_lena.id,
#     cloudflare_zero_trust_access_policy.allow_oma.id,
#     cloudflare_zero_trust_access_policy.overseerr_token.id
#   ]
#   allowed_idps = [
#     cloudflare_zero_trust_access_identity_provider.entra_id.id,
#     cloudflare_zero_trust_access_identity_provider.google_workspace.id,
#     cloudflare_zero_trust_access_identity_provider.gmail.id,
#     cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
#     cloudflare_zero_trust_access_identity_provider.pin.id,
#   ]
#   app_launcher_visible       = true
#   auto_redirect_to_identity  = false
#   domain                     = "overseerr.${var.domain_name}"
#   enable_binding_cookie      = false
#   http_only_cookie_attribute = true
#   name                       = "Overseerr"
#   same_site_cookie_attribute = "lax"
#   session_duration           = "24h"
#   type                       = "self_hosted"
#   destinations {
#     type = "public"
#     uri  = "overseerr.${var.domain_name}"
#   }
#   cors_headers {
#     allow_all_headers = true
#     allow_all_methods = true
#     allow_credentials = true
#     allowed_origins   = ["overseerr.${var.domain_name}"]
#     max_age           = 3600
#   }
# }

resource "cloudflare_zero_trust_access_application" "app_launcher" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  auto_redirect_to_identity = false
  domain                    = "erfianugrah.cloudflareaccess.com"
  name                      = "App Launcher"
  session_duration          = "24h"
  type                      = "app_launcher"
}

# resource "cloudflare_zero_trust_access_application" "synapse_admin" {
#   account_id = var.cloudflare_account_id
#   policies = [
#     cloudflare_zero_trust_access_policy.allow_erfi.id
#   ]
#   allowed_idps = [
#     cloudflare_zero_trust_access_identity_provider.entra_id.id,
#     cloudflare_zero_trust_access_identity_provider.google_workspace.id,
#     cloudflare_zero_trust_access_identity_provider.gmail.id,
#     cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
#     cloudflare_zero_trust_access_identity_provider.pin.id
#   ]
#   app_launcher_visible       = true
#   auto_redirect_to_identity  = false
#   domain                     = "synapse-admin.${var.domain_name}"
#   enable_binding_cookie      = false
#   http_only_cookie_attribute = true
#   name                       = "Synapse-Admin"
#   same_site_cookie_attribute = "lax"
#   session_duration           = "24h"
#   type                       = "self_hosted"
#   destinations {
#     type = "public"
#     uri  = "synapse-admin.${var.domain_name}"
#   }
#   cors_headers {
#     allow_all_headers = true
#     allow_all_methods = true
#     allowed_origins   = ["synapse-admin.${var.domain_name}"]
#     max_age           = 3600
#   }
# }

resource "cloudflare_zero_trust_access_application" "servarr" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "servarr.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = true
  name                       = "Servarr"
  same_site_cookie_attribute = "lax"
  session_duration           = "15m"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "servarr.${var.domain_name}"
  }
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allowed_origins   = [var.domain_name, "servarr.${var.domain_name}"]
    max_age           = 3600
  }
}

resource "cloudflare_zero_trust_access_application" "caddy_api" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.caddy_api_token.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "caddy.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Caddy API"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "caddy.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "ollama" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.ollama_token.id,
    cloudflare_zero_trust_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "ollama.${var.domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Ollama API"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "ollama.${var.domain_name}"
  }
}

resource "cloudflare_zero_trust_access_application" "tldraw" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.allow_cf.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.entra_id.id,
    cloudflare_zero_trust_access_identity_provider.google_workspace.id,
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
    cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "draw.${var.secondary_domain_name}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "TLDraw"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  destinations {
    type = "public"
    uri  = "draw.${var.secondary_domain_name}"
  }
}
# resource "cloudflare_zero_trust_access_application" "kubectl" {
#   account_id = var.cloudflare_account_id
#   policies = [
#     cloudflare_zero_trust_access_policy.allow_erfi.id,
#   ]
#   allowed_idps = [
#     cloudflare_zero_trust_access_identity_provider.entra_id.id,
#     cloudflare_zero_trust_access_identity_provider.google_workspace.id,
#     cloudflare_zero_trust_access_identity_provider.gmail.id,
#     cloudflare_zero_trust_access_identity_provider.keycloak_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_oidc.id,
#     cloudflare_zero_trust_access_identity_provider.authentik_saml.id,
#     cloudflare_zero_trust_access_identity_provider.pin.id
#   ]
#   app_launcher_visible       = true
#   auto_redirect_to_identity  = false
#   domain                     = "kubectl.${var.domain_name}"
#   enable_binding_cookie      = false
#   http_only_cookie_attribute = false
#   name                       = "Kubectl"
#   self_hosted_domains        = ["kubectl.${var.domain_name}"]
#   service_auth_401_redirect  = true
#   session_duration           = "24h"
#   type                       = "self_hosted"
# }

resource "cloudflare_zero_trust_access_application" "interview" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_zero_trust_access_policy.allow_erfi.id,
    cloudflare_zero_trust_access_policy.allow_interview.id,
    cloudflare_zero_trust_access_policy.allow_lena.id,
    cloudflare_zero_trust_access_policy.allow_unker.id,
    cloudflare_zero_trust_access_policy.allow_oma.id
  ]
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.gmail.id,
    cloudflare_zero_trust_access_identity_provider.pin.id
  ]
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "interview-0.pages.dev"
  enable_binding_cookie      = true
  http_only_cookie_attribute = false
  same_site_cookie_attribute = "lax"
  name                       = "Interview"
  service_auth_401_redirect  = true
  session_duration           = "24h"
  type                       = "self_hosted"
  logo_url                   = "https://cdn.erfianugrah.com/ea_favicon.png"
  cors_headers {
    allow_all_headers = true
    allow_all_methods = true
    allow_credentials = true
    allowed_origins   = [var.domain_name, "interview-0.pages.dev"]
    max_age           = 3600
  }
  destinations {
    type = "public"
    uri  = "interview-0.pages.dev"
  }
  destinations {
    type = "public"
    uri  = "*.interview-0.pages.dev"
  }
}
