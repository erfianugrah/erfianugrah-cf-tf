module "media_dns" {
  source = "./modules/dns_records"

  zone_id     = var.thirdary_cloudflare_zone_id
  domain_name = var.thirdary_domain_name

  records = {
    # Active records
    bazarr = {
      name    = "bazarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "subs"
      tags    = ["servarr"]
    },
    change = {
      name    = "change"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "site crawler for changes"
      tags    = ["servarr"]
    },
    # element = {
    #   name    = "element"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "web app for matrix"
    #   tags    = ["servarr"]
    # },
    file = {
      name    = "file"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "file browser"
      tags    = ["servarr"]
    },
    httpbin = {
      name    = "httpbin"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "httpbin"
      tags    = ["servarr"]
    },
    immich = {
      name    = "immich"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "self-hosted google photos"
      tags    = ["servarr"]
    },
    jellyfin = {
      name    = "jellyfin"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "like plex but not"
      tags    = ["servarr"]
    },
    joplin = {
      name    = "joplin"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "notes"
      tags    = ["servarr"]
    },
    navidrome = {
      name    = "navidrome"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "music"
      tags    = ["servarr"]
    },
    # overseerr = {
    #   name    = "overseerr"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "overseerr"
    #   tags    = ["servarr"]
    # },
    plex = {
      name    = "plex"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "plex"
      tags    = ["servarr"]
    },
    prowlarr = {
      name    = "prowlarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "indexer"
      tags    = ["servarr"]
    },
    qbit = {
      name    = "qbit"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "qbit"
      tags    = ["servarr"]
    },
    radarr = {
      name    = "radarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "radarr"
      tags    = ["servarr"]
    },
    sabnzbd = {
      name    = "sabnzbd"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "usenet"
      tags    = ["servarr"]
    },
    sonarr = {
      name    = "sonarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "sonarr"
      tags    = ["servarr"]
    },
    # tautulli = {
    #   name    = "tautulli"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "plex usage"
    #   tags    = ["servarr"]
    # },
    servarr = {
      name    = "servarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "unraid admin"
      tags    = ["servarr"]
    },
    # beets = {
    #   name    = "beets"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "tagging music"
    #   tags    = ["servarr"]
    # },
    # caddy_api = {
    #   name    = "caddy"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "caddy-api"
    #   tags    = ["servarr"]
    # },
    # caddy_prometheus = {
    #   name    = "caddy-prometheus"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "caddy-monitoring"
    #   tags    = ["servarr"]
    # },
    cadvisor = {
      name    = "cadvisor"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "docker monitoring"
      tags    = ["servarr"]
    },
    calibre = {
      name    = "calibre"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "books"
      tags    = ["servarr"]
    },
    # homer = {
    #   name    = "homer"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "dashboard"
    #   tags    = ["servarr"]
    # },
    # hydra = {
    #   name    = "hydra"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "usenet indexer aggregator"
    #   tags    = ["servarr"]
    # },
    # ihatemoney = {
    #   name    = "ihatemoney"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "collaborative expense app"
    #   tags    = ["servarr"]
    # },
    # jackett = {
    #   name    = "jackett"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "indexer"
    #   tags    = ["servarr"]
    # },
    # nodered = {
    #   name    = "nodered"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "nodered"
    #   tags    = ["servarr"]
    # },
    # port = {
    #   name    = "port"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "portainer sg on unraid"
    #   tags    = ["servarr"]
    # },
    # privatebin = {
    #   name    = "privatebin"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "privatebin"
    #   tags    = ["servarr"]
    # },
    # qdirstat = {
    #   name    = "qdirstat"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "directory file analyser"
    #   tags    = ["servarr"]
    # },
    # rclone = {
    #   name    = "rclone"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "rclone"
    #   tags    = ["servarr"]
    # },
    # synapse = {
    #   name    = "synapse"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "synapse"
    #   tags    = ["servarr"]
    # },
    # synapse_admin = {
    #   name    = "synapse-admin"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "synapse-admin"
    #   tags    = ["servarr"]
    # },
    # file = {
    #   name    = "file"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "file browser"
    #   tags    = ["servarr"]
    # },
    # dockge = {
    #   name    = "dockge"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "docker UI"
    #   tags    = ["servarr"]
    # },
    dockge_sg = {
      name    = "dockge-sg"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "dockge-sg"
      tags    = ["servarr"]
    },
    jellyseerr = {
      name    = "seerr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "jellyseerr"
      tags    = ["servarr"]
    },
    # quantum = {
    #   name    = "quantum"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "quantum"
    #   tags    = ["servarr"]
    # },
    copyparty = {
      name    = "copyparty"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "file server"
      tags    = ["servarr"]
    }
    # root_revista = {
    #   name    = "@"
    #   type    = "CNAME"
    #   content = var.pages_domain
    #   proxied = true
    #   ttl     = 1
    #   comment = "revista"
    #   tags    = ["revista"]
    # }
    # Additional commented media services can be added here
  }
}
