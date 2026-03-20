module "media_dns" {
  source = "./modules/dns_records"

  zone_id     = var.tertiary_cloudflare_zone_id
  domain_name = var.tertiary_domain_name

  records = {
    atuin = {
      name    = "atuin"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "atuin"
      tags    = ["servarr"]
    },
    minio = {
      name    = "cdn"
      type    = "A"
      content = var.sg_ip
      proxied = false
      ttl     = 1
      comment = "minio"
      tags    = ["servarr"]
    },
    waf = {
      name    = "waf"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "waf"
      tags    = ["servarr"]
    },
    ech = {
      name    = "ech"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "ech"
      tags    = ["servarr"]
    },
    authelia = {
      name    = "authelia"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "auth"
      tags    = ["servarr"]
    },
    bazarr = {
      name    = "bazarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "subs"
      tags    = ["servarr"]
    },
    change = {
      name    = "change"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "site crawler for changes"
      tags    = ["servarr"]
    },
    file = {
      name    = "file"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "file browser"
      tags    = ["servarr"]
    },
    immich = {
      name    = "immich"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "self-hosted google photos"
      tags    = ["servarr"]
    },
    jellyfin = {
      name    = "jellyfin"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "like plex but not"
      tags    = ["servarr"]
    },
    joplin = {
      name    = "joplin"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "notes"
      tags    = ["servarr"]
    },
    navidrome = {
      name    = "navidrome"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "music"
      tags    = ["servarr"]
    },
    prowlarr = {
      name    = "prowlarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "indexer"
      tags    = ["servarr"]
    },
    qbit = {
      name    = "qbit"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "qbit"
      tags    = ["servarr"]
    },
    radarr = {
      name    = "radarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "radarr"
      tags    = ["servarr"]
    },
    sabnzbd = {
      name    = "sabnzbd"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "usenet"
      tags    = ["servarr"]
    },
    sonarr = {
      name    = "sonarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "sonarr"
      tags    = ["servarr"]
    },
    servarr = {
      name    = "servarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "unraid admin"
      tags    = ["servarr"]
    },
    cadvisor = {
      name    = "cadvisor"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "docker monitoring"
      tags    = ["servarr"]
    },
    calibre = {
      name    = "calibre"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "books"
      tags    = ["servarr"]
    },
    dockge = {
      name    = "dockge"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "dockge"
      tags    = ["servarr"]
    },
    jellyseerr = {
      name    = "seerr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "jellyseerr"
      tags    = ["servarr"]
    },
    httpbun = {
      name    = "httpbun"
      type    = "A"
      content = var.sg_ip
      proxied = false
      ttl     = 1
      comment = "httpbun"
      tags    = ["servarr"]
    },
    httpbin = {
      name    = "httpbin"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "httpbin"
      tags    = ["servarr"]
    },
    copyparty = {
      name    = "copyparty"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "file server"
      tags    = ["servarr"]
    },
    tracearr = {
      name    = "tracearr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "tracearr"
      tags    = ["servarr"]
    }
  }
}
