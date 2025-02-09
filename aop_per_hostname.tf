resource "cloudflare_authenticated_origin_pulls" "joplin" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.joplin.id
  hostname                               = "joplin.${var.domain_name}"
  enabled                                = true
}

resource "cloudflare_authenticated_origin_pulls" "vaultwarden" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.vaultwarden.id
  hostname                               = "vaultwarden.${var.domain_name}"
  enabled                                = true
}

resource "cloudflare_authenticated_origin_pulls" "privatebin" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.privatebin.id
  hostname                               = "privatebin.${var.domain_name}"
  enabled                                = true
}

resource "cloudflare_authenticated_origin_pulls" "immich" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.immich.id
  hostname                               = "immich.${var.domain_name}"
  enabled                                = true
}

resource "cloudflare_authenticated_origin_pulls" "file" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.file.id
  hostname                               = "file.${var.domain_name}"
  enabled                                = true
}

resource "cloudflare_authenticated_origin_pulls" "caddy_api" {
  zone_id                                = var.cloudflare_zone_id
  authenticated_origin_pulls_certificate = cloudflare_authenticated_origin_pulls_certificate.caddy_api.id
  hostname                               = "caddy.${var.domain_name}"
  enabled                                = true
}
