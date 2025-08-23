output "google_saas" {
  value = {
    consumer_service_url = cloudflare_zero_trust_access_application.google_saas.saas_app[0].consumer_service_url
    sp_entity_id         = cloudflare_zero_trust_access_application.google_saas.saas_app[0].sp_entity_id
    name_id_format       = cloudflare_zero_trust_access_application.google_saas.saas_app[0].name_id_format
    name                 = cloudflare_zero_trust_access_application.google_saas.name
    domain               = cloudflare_zero_trust_access_application.google_saas.domain
    type                 = cloudflare_zero_trust_access_application.google_saas.type
  }
  sensitive = true
}

output "authentik_saas" {
  value = {
    client_id     = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].client_id
    client_secret = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].client_secret
    auth_type     = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].auth_type
    redirect_uris = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].redirect_uris
    grant_types   = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].grant_types
    scopes        = cloudflare_zero_trust_access_application.authentik_saas.saas_app[0].scopes
    name          = cloudflare_zero_trust_access_application.authentik_saas.name
    domain        = cloudflare_zero_trust_access_application.authentik_saas.domain
    type          = cloudflare_zero_trust_access_application.authentik_saas.type
  }
  sensitive = true
}

output "immich_saas" {
  value = {
    client_id     = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].client_id
    client_secret = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].client_secret
    public_key    = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].public_key
    auth_type     = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].auth_type
    redirect_uris = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].redirect_uris
    grant_types   = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].grant_types
    scopes        = cloudflare_zero_trust_access_application.immich_saas.saas_app[0].scopes
    name          = cloudflare_zero_trust_access_application.immich_saas.name
    domain        = cloudflare_zero_trust_access_application.immich_saas.domain
    type          = cloudflare_zero_trust_access_application.immich_saas.type
  }
  sensitive = true
}

output "kubectl_saas" {
  value = {
    client_id                        = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].client_id
    client_secret                    = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].client_secret
    public_key                       = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].public_key
    auth_type                        = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].auth_type
    redirect_uris                    = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].redirect_uris
    grant_types                      = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].grant_types
    scopes                           = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].scopes
    allow_pkce_without_client_secret = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].allow_pkce_without_client_secret
    access_token_lifetime            = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].access_token_lifetime
    refresh_token_options            = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].refresh_token_options
    hybrid_and_implicit_options      = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].hybrid_and_implicit_options
    name                             = cloudflare_zero_trust_access_application.kubectl_saas.name
    domain                           = cloudflare_zero_trust_access_application.kubectl_saas.domain
    type                             = cloudflare_zero_trust_access_application.kubectl_saas.type
  }
  sensitive = true
}

output "prometheus_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.prometheus_token.id
    client_id     = cloudflare_zero_trust_access_service_token.prometheus_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.prometheus_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.prometheus_token.name
  }
  sensitive = true
}

output "tunnel_secret_worker_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.tunnel_secret_worker_token.id
    client_id     = cloudflare_zero_trust_access_service_token.tunnel_secret_worker_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.tunnel_secret_worker_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.tunnel_secret_worker_token.name
  }
  sensitive = true
}

output "caddy_api_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.caddy_api_token.id
    client_id     = cloudflare_zero_trust_access_service_token.caddy_api_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.caddy_api_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.caddy_api_token.name
  }
  sensitive = true
}

output "ollama_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.ollama_token.id
    client_id     = cloudflare_zero_trust_access_service_token.ollama_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.ollama_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.ollama_token.name
  }
  sensitive = true
}

output "warp_auth_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.warp_auth_token.id
    client_id     = cloudflare_zero_trust_access_service_token.warp_auth_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.warp_auth_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.warp_auth_token.name
  }
  sensitive = true
}

output "overseerr_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.overseerr_token.id
    client_id     = cloudflare_zero_trust_access_service_token.overseerr_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.overseerr_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.overseerr_token.name
  }
  sensitive = true
}

output "servarr_token" {
  value = {
    id            = cloudflare_zero_trust_access_service_token.servarr_token.id
    client_id     = cloudflare_zero_trust_access_service_token.servarr_token.client_id
    client_secret = cloudflare_zero_trust_access_service_token.servarr_token.client_secret
    name          = cloudflare_zero_trust_access_service_token.servarr_token.name
  }
  sensitive = true
}

