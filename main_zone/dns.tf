# DNS records using the module approach
# This file replaces dns.tf by using the dns_records module

# Media Services Module (all servarr-tagged records)
module "media_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

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
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "site crawler for changes"
      tags    = ["servarr"]
    },
    element = {
      name    = "element"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "web app for matrix"
      tags    = ["servarr"]
    },
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
    keycloak = {
      name    = "keycloak"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "keycloak IDP"
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
    overseerr = {
      name    = "overseerr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "overseerr"
      tags    = ["servarr"]
    },
    plex = {
      name    = "plex"
      type    = "A"
      content = var.sg_ip
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
      type    = "A"
      content = var.sg_ip
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
    tautulli = {
      name    = "tautulli"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "plex usage"
      tags    = ["servarr"]
    },
    servarr = {
      name    = "servarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "unraid admin"
      tags    = ["servarr"]
    },
    vaultwarden = {
      name    = "vaultwarden"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "bitwarden"
      tags    = ["servarr"]
    },
    # Commented-out records
    beets = {
      name    = "beets"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "tagging music"
      tags    = ["servarr"]
    },
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
    homer = {
      name    = "homer"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "dashboard"
      tags    = ["servarr"]
    },
    hydra = {
      name    = "hydra"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "usenet indexer aggregator"
      tags    = ["servarr"]
    },
    ihatemoney = {
      name    = "ihatemoney"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "collaborative expense app"
      tags    = ["servarr"]
    },
    # jackett = {
    #   name    = "jackett"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "indexer"
    #   tags    = ["servarr"]
    # },
    mealie = {
      name    = "mealie"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "recipes"
      tags    = ["servarr"]
    },
    minio = {
      name    = "minio"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "s3 storage"
      tags    = ["servarr"]
    },
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
    file = {
      name    = "file"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "file browser"
      tags    = ["servarr"]
    },
    dockge = {
      name    = "dockge"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "docker UI"
      tags    = ["servarr"]
    },
    dockge_sg = {
      name    = "dockge-sg"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "dockge-sg"
      tags    = ["servarr"]
    }
    # Additional commented media services can be added here
  }
}

# ProxMox Infrastructure Module
module "proxmox_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Active records
    proxmox_ui = {
      name    = "proxmox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "proxmox web ui"
      tags    = ["proxmox"]
    },
    proxmox_ssh = {
      name    = "*.proxmox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "proxmox ssh"
      tags    = ["proxmox"]
    },
    kvm = {
      name    = "kvm"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "pikvm"
      tags    = ["kvm-sg"]
    },
    kvm_nl = {
      name    = "kvm-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.cname
      proxied = true
      ttl     = 1
      comment = "pikvm nl"
      tags    = ["kvm-nl"]
    },
    ssh_pikvm_sg = {
      name    = "ssh-pikvm-sg"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.kvm_sg.cname
      proxied = true
      ttl     = 1
      comment = "SSH access to pikvm sg"
      tags    = ["kvm-sg"]
    },
    ssh_pikvm_nl = {
      name    = "ssh-pikvm-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.cname
      proxied = true
      ttl     = 1
      comment = "SSH access to pikvm nl"
      tags    = ["kvm-nl"]
    },
    # Add all other proxmox records
    # Commented out records can be added here
  }
}

# VyOS Infrastructure Module - Netherlands
module "vyos_nl_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Active records
    vyos_node_exporter = {
      name    = "vyos-node-exporter"
      type    = "A"
      content = var.nl_ip
      proxied = true
      ttl     = 1
      comment = "vyos-node-exporter"
      tags    = ["vyos-nl"]
    },
    vyos_ssh_nl = {
      name    = "nl.vyos"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "VyOS SSH NL"
      tags    = ["vyos-nl"]
    },
    coredns_prom_exporter_nl = {
      name    = "coredns-prom-exporter-nl"
      type    = "A"
      content = var.nl_ip
      proxied = true
      ttl     = 1
      comment = "monitoring for coredns"
      tags    = ["vyos-nl"]
    },
    httpbun_nl = {
      name    = "httpbun-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "httpbun on vyos-nl"
      tags    = ["vyos-nl"]
    },
    pihole_vyos_nl = {
      name    = "pihole-vyos-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "pihole-nl"
      tags    = ["vyos-nl"]
    },
    tpi = {
      name    = "tpi"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "turing pi BMC"
      tags    = ["k3s"]
    },
    # vyos_fileservarr = {
    #   name    = "vyos-fileservarr"
    #   type    = "A"
    #   content = var.nl_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "vyos-fileservarr"
    #   tags    = ["vyos-nl"]
    # },
    # prom_caddy_nl = {
    #   name    = "prom-caddy-nl"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "caddy on vyos-nl"
    #   tags    = ["vyos-nl"]
    # },
    prom_tunnel_nl = {
      name    = "prom-tunnel-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "cfd node exporter"
      tags    = ["vyos-nl"]
    },
    prom_vyos_nl = {
      name    = "prom-vyos-nl"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "cfd node exporter"
      tags    = ["vyos-nl"]
    },
    # Add all other vyos-nl records
    # Commented out records can be added here
  }
}

# VyOS Infrastructure Module - Singapore
module "vyos_sg_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Active records
    vyos_sg_ssh = {
      name    = "sg.vyos"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_sg.cname
      proxied = true
      ttl     = 1
      comment = "VyOS SSH SG"
      tags    = ["vyos-sg"]
    },
    coredns_prom_exporter_sg = {
      name    = "coredns-prom-exporter-sg"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "monitoring for coredns"
      tags    = ["vyos-sg"]
    },
    pihole_vyos_sg = {
      name    = "pihole-vyos-sg"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_sg.cname
      proxied = true
      ttl     = 1
      comment = "pihole-sg"
      tags    = ["vyos-sg"]
    },
    ping = {
      name    = "ping"
      type    = "A"
      content = var.sg_ip
      proxied = false
      ttl     = 60
      comment = "check IP"
      tags    = ["vyos-sg"]
    },
    # prom_caddy_sg = {
    #   name    = "prom-caddy-sg"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "caddy on unraid"
    #   tags    = ["servarr"]
    # },
    # prom_unraid = {
    #   name    = "prom-unraid"
    #   type    = "A"
    #   content = var.sg_ip
    #   proxied = true
    #   ttl     = 1
    #   comment = "prometheus"
    #   tags    = ["servarr"]
    # },
    # Add all other vyos-sg records
    # Commented out records can be added here
  }
}

# Authentication and Security Module
module "auth_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Active records
    keycloak = {
      name    = "keycloak"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "auth server"
      tags    = ["auth"]
    },
    vaultwarden = {
      name    = "vaultwarden"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "password manager"
      tags    = ["auth"]
    },
    # Add all other auth records
  }
}

# Email Module
module "email_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Mail records
    area_1_mx_1 = {
      name     = var.domain_name
      type     = "MX"
      content  = "mailstream-central.mxrecord.mx"
      priority = 50
      ttl      = 300
      comment  = "area 1"
      tags     = ["area1"]
      proxied  = false
    },
    area_1_mx_2 = {
      name     = var.domain_name
      type     = "MX"
      content  = "mailstream-west.mxrecord.io"
      priority = 10
      ttl      = 300
      comment  = "area 1"
      tags     = ["area1"]
      proxied  = false
    },
    area_1_mx_3 = {
      name     = var.domain_name
      type     = "MX"
      content  = "mailstream-east.mxrecord.io"
      priority = 10
      ttl      = 300
      comment  = "area 1"
      tags     = ["area1"]
      proxied  = false
    },
    spf = {
      name    = var.domain_name
      type    = "TXT"
      content = "v=spf1 include:_spf.google.com -all"
      ttl     = 3600
      comment = "spf"
      proxied = false
    },
    _dmarc = {
      name    = "_dmarc"
      type    = "TXT"
      content = "v=DMARC1; p=quarantine; rua=mailto:e764748fc3894bf4bbae2a91ea79b3d2@dmarc-reports.cloudflare.net,mailto:iam@${var.domain_name}"
      ttl     = 1
      comment = "dmarc policy"
      proxied = false
    },
    google_txt = {
      name    = var.domain_name
      type    = "TXT"
      content = "google-site-verification=7_N_bCOCpjU9g0Ii93cVDwZLZU1YoFukRgOpHiZSYmo"
      ttl     = 3600
      comment = "google verification"
      proxied = false
    },
  }
}

# Storage Module
module "storage_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Storage records
    r2 = {
      name    = "r2"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "r2 custom domain test"
      tags    = ["r2"]
    },
    gcs = {
      name    = "gcs"
      type    = "CNAME"
      content = "storage.googleapis.com"
      proxied = true
      ttl     = 1
      comment = "bucket"
      tags    = ["gcs"]
    },
    gcs_fetch_test = {
      name    = "gcs-fetch-test"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "gcp storage bucket"
    },
  }
}

# Special Purpose/Miscellaneous Module
module "special_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # Special records
    atuin = {
      name    = "atuin"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "atuin"
      tags    = ["erfipie"]
    },
    discord = {
      name    = "_discord.www"
      type    = "TXT"
      content = "dh=7d34085eab91e78966c915413fb93503577d516e"
      ttl     = 1
      comment = "discord"
      tags    = ["discord"]
    },
    erfipie = {
      name    = "pie"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "erfipie short-lived-cert ssh"
      tags    = ["erfipie"]
    },
    k3s_tunnel = {
      name    = "k3stun"
      type    = "CNAME"
      content = var.k3s_tunnel
      proxied = true
      ttl     = 1
      comment = "k3s zero trust tunnel"
      tags    = ["k3s"]
    },
    ollama = {
      name    = "ollama"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfi1.cname
      proxied = true
      ttl     = 1
      comment = "ollama AI service"
    },
    ollama_ui = {
      name    = "ollama-ui"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfi1.cname
      proxied = true
      ttl     = 1
      comment = "ollama UI"
    },
    prom_exporter_pi = {
      name    = "prom-exporter-pi"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "erfipie node exporter"
      tags    = ["erfipie"]
    },
    tldraw = {
      name    = "tldraw"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "drawing"
      tags    = ["tldraw"]
    },
    tunnel = {
      name    = "tunnel"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "zero trust tunnel"
    },
    whatami = {
      name    = "whatami"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "whatami test site"
    },
    www = {
      name    = "www"
      type    = "CNAME"
      content = var.pages_domain
      proxied = true
      ttl     = 1
      comment = "www"
      tags    = ["www"]
    },
    # acme_challenge_custom_hostname_2 = {
    #   name    = "_acme-challenge.custom-hostname-2"
    #   type    = "CNAME"
    #   content = "custom-hostname-2.${var.domain_name}.b63bf2e93a182db4.dcv.cloudflare.com"
    #   proxied = true
    #   ttl     = 1
    #   comment = "dcv delegation test"
    # },
    coffee_test = {
      name    = "coffee.test"
      type    = "CNAME"
      content = "coffee-time.pages.dev"
      proxied = true
      ttl     = 1
    },
    challenge = {
      name    = "challenge"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "challenge record"
    },
    custom_hostname = {
      name    = "custom-hostname"
      type    = "CNAME"
      content = "httpbun.${var.domain_name}"
      proxied = true
      ttl     = 1
      comment = "custom hostname"
    },
    custom_hostname_2 = {
      name    = "custom-hostname-2"
      type    = "CNAME"
      content = "fallback.epikbahis175.com"
      proxied = false
      ttl     = 1
      comment = "custom hostname 2"
    },
    httpbun = {
      name    = "httpbun"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "httpbun"
    },
    docs = {
      name    = "docs"
      type    = "CNAME"
      content = "erfi-docs.pages.dev"
      proxied = true
      ttl     = 1
      comment = "documentation"
    },
    # DNS delegation records
    best_delegation_1 = {
      name    = "best"
      type    = "NS"
      content = "lola.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    best_delegation_2 = {
      name    = "best"
      type    = "NS"
      content = "jeremy.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    dev_saas_delegation_1 = {
      name    = "dev.saas"
      type    = "NS"
      content = "lola.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    dev_saas_delegation_2 = {
      name    = "dev.saas"
      type    = "NS"
      content = "jeremy.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    erfiplan_delegation_1 = {
      name    = "erfiplan"
      type    = "NS"
      content = "vicky.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    erfiplan_delegation_2 = {
      name    = "erfiplan"
      type    = "NS"
      content = "monika.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    freeplan_delegation_1 = {
      name    = "freeplan"
      type    = "NS"
      content = "lola.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    freeplan_delegation_2 = {
      name    = "freeplan"
      type    = "NS"
      content = "jeremy.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    prod_saas_delegation_1 = {
      name    = "prod.saas"
      type    = "NS"
      content = "lola.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    },
    prod_saas_delegation_2 = {
      name    = "prod.saas"
      type    = "NS"
      content = "jeremy.ns.cloudflare.com"
      proxied = false
      ttl     = 1
    }
  }
}

# Proxmox Secondary Zone Module
module "proxmox_secondary_dns" {
  source = "./modules/dns_records"

  zone_id     = var.secondary_cloudflare_zone_id
  domain_name = var.secondary_domain_name

  records = {
    plex_mox = {
      name    = "plex-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Plex on Proxmox"
      tags    = ["proxmox"]
    },
    jellyfin_mox = {
      name    = "jellyfin-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Jellyfin on Proxmox"
      tags    = ["proxmox"]
    },
    prowlarr_mox = {
      name    = "prowlarr-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Prowlarr on Proxmox"
      tags    = ["proxmox"]
    },
    radarr_mox = {
      name    = "radarr-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Radarr on Proxmox"
      tags    = ["proxmox"]
    },
    sonarr_mox = {
      name    = "sonarr-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Sonarr on Proxmox"
      tags    = ["proxmox"]
    },
    bazarr_mox = {
      name    = "bazarr-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Bazarr on Proxmox"
      tags    = ["proxmox"]
    },
    tautulli_mox = {
      name    = "tautulli-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Tautulli on Proxmox"
      tags    = ["proxmox"]
    },
    navidrome_mox = {
      name    = "navidrome-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Navidrome on Proxmox"
      tags    = ["proxmox"]
    },
    solvarr_mox = {
      name    = "solvarr-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "Solvarr on Proxmox"
      tags    = ["proxmox"]
    },
    sabnzbd_mox = {
      name    = "sabnzbd-mox"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.proxmox.cname
      proxied = true
      ttl     = 1
      comment = "SABnzbd on Proxmox"
      tags    = ["proxmox"]
    }
  }
}

# Add other groups of DNS records as needed

