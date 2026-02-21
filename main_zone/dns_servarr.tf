module "media_dns" {
  source = "./modules/dns_records"

  zone_id     = var.tertiary_cloudflare_zone_id
  domain_name = var.tertiary_domain_name

  records = {
    # Active records
    ech = {
      name            = "ech"
      type            = "A"
      content         = var.sg_ip
      proxied         = true
      ttl             = 1
      comment         = "ech"
      tags            = ["servarr"]
      allow_overwrite = true
    },
    authelia = {
      name            = "authelia"
      type            = "A"
      content         = var.sg_ip
      proxied         = true
      ttl             = 1
      comment         = "auth"
      tags            = ["servarr"]
      allow_overwrite = true
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
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "file browser"
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
    # overseerr = {
    #   name    = "overseerr"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "overseerr"
    #   tags    = ["servarr"]
    # },
    # plex = {
    #   name    = "plex"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "plex"
    #   tags    = ["servarr"]
    # },
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
    # tautulli = {
    #   name    = "tautulli"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "plex usage"
    #   tags    = ["servarr"]
    # },
    servarr = {
      name    = "servarr"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "unraid admin"
      tags    = ["servarr"]
    },
    # beets = {
    #   name    = "beets"
    #   type    = "A"
    #   content = var.sg_ip
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
    # homer = {
    #   name    = "homer"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "dashboard"
    #   tags    = ["servarr"]
    # },
    # hydra = {
    #   name    = "hydra"
    #   type    = "A"
    #   content = var.sg_ip
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
    #   type    = "A"
    #   content = var.sg_ip
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
    #   type    = "A"
    #   content = var.sg_ip
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
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "file browser"
    #   tags    = ["servarr"]
    # },
    # dockge = {
    #   name    = "dockge"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "docker UI"
    #   tags    = ["servarr"]
    # },
    dockge_sg = {
      name    = "dockge-sg"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "dockge-sg"
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
    # quantum = {
    #   name    = "quantum"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "quantum"
    #   tags    = ["servarr"]
    # },
    copyparty = {
      name    = "copyparty"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "file server"
      tags    = ["servarr"]
    }
  }
}

# Matrix moved to k3s cluster - DNS managed in k3s/cloudflare-tunnel-tf
# module "matrix_dns" {
#   source = "./modules/dns_records"
#
#   zone_id     = var.tertiary_cloudflare_zone_id
#   domain_name = var.tertiary_domain_name
#
#   records = {
#     matrix = {
#       name    = "matrix"
#       type    = "A"
#       content = module.tunnel_erfipie.cname
#       proxied = true
#       ttl     = 1
#       comment = "Matrix Synapse homeserver"
#       tags    = ["matrix"]
#     },
#     chat = {
#       name    = "chat"
#       type    = "A"
#       content = module.tunnel_erfipie.cname
#       proxied = true
#       ttl     = 1
#       comment = "Element Web client"
#       tags    = ["matrix"]
#     },
#     matrix_admin = {
#       name    = "admin.matrix"
#       type    = "A"
#       content = module.tunnel_erfipie.cname
#       proxied = true
#       ttl     = 1
#       comment = "Synapse Admin"
#       tags    = ["matrix"]
#     }
#   }
# }
