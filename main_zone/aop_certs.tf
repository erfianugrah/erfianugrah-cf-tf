resource "cloudflare_authenticated_origin_pulls_certificate" "joplin" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.joplin_pem
  private_key = local.joplin_key
  type        = "per-hostname"
}

resource "cloudflare_authenticated_origin_pulls_certificate" "privatebin" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.privatebin_pem
  private_key = local.privatebin_key
  type        = "per-hostname"
}

resource "cloudflare_authenticated_origin_pulls_certificate" "vaultwarden" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.vaultwarden_pem
  private_key = local.vaultwarden_key
  type        = "per-hostname"
}

resource "cloudflare_authenticated_origin_pulls_certificate" "immich" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.immich_pem
  private_key = local.immich_key
  type        = "per-hostname"
}

resource "cloudflare_authenticated_origin_pulls_certificate" "file" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.file_pem
  private_key = local.file_key
  type        = "per-hostname"
}

resource "cloudflare_authenticated_origin_pulls_certificate" "caddy_api" {
  zone_id     = var.cloudflare_zone_id
  certificate = local.caddy_pem
  private_key = local.caddy_key
  type        = "per-hostname"
}