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
    client_id     = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].client_id
    client_secret = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].client_secret
    public_key    = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].public_key
    auth_type     = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].auth_type
    redirect_uris = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].redirect_uris
    grant_types   = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].grant_types
    scopes        = cloudflare_zero_trust_access_application.kubectl_saas.saas_app[0].scopes
    name          = cloudflare_zero_trust_access_application.kubectl_saas.name
    domain        = cloudflare_zero_trust_access_application.kubectl_saas.domain
    type          = cloudflare_zero_trust_access_application.kubectl_saas.type
  }
  sensitive = true
}

