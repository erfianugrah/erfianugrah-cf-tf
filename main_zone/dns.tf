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
    jellyfin = {
      name    = "jellyfin"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "media server"
      tags    = ["servarr"]
    },
    navidrome = {
      name    = "navidrome"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "music server"
      tags    = ["servarr"]
    },
    overseerr = {
      name    = "overseerr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "media requests"
      tags    = ["servarr"]
    },
    plex = {
      name    = "plex"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "media server"
      tags    = ["servarr"]
    },
    prowlarr = {
      name    = "prowlarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "indexer aggregation"
      tags    = ["servarr"]
    },
    qbit = {
      name    = "qbit"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "torrent client"
      tags    = ["servarr"]
    },
    radarr = {
      name    = "radarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "movies"
      tags    = ["servarr"]
    },
    sabnzbd = {
      name    = "sabnzbd"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "nzb client"
      tags    = ["servarr"]
    },
    sonarr = {
      name    = "sonarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "tv shows"
      tags    = ["servarr"]
    },
    tautulli = {
      name    = "tautulli"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "plex monitoring"
      tags    = ["servarr"]
    },
    servarr = {
      name    = "servarr"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "catch all"
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
      name    = "proxmox-ui"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "proxmox web ui"
      tags    = ["proxmox"]
    },
    proxmox_ssh = {
      name    = "proxmox-ssh"
      type    = "A"
      content = var.sg_ip
      proxied = false
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
      type    = "A"
      content = var.nl_ip
      proxied = true
      ttl     = 1
      comment = "pikvm-nl"
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
      name    = "vyos-ssh-nl"
      type    = "A"
      content = var.nl_ip
      proxied = false
      ttl     = 1
      comment = "vyos-ssh"
      tags    = ["vyos-nl"]
    },
    coredns_prom_exporter_nl = {
      name    = "coredns-prom-exporter-nl"
      type    = "A"
      content = var.nl_ip
      proxied = true
      ttl     = 1
      comment = "coredns-prometheus-exporter-nl"
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
      name    = "vyos-sg-ssh"
      type    = "A"
      content = var.sg_ip
      proxied = false
      ttl     = 1
      comment = "vyos-sg-ssh"
      tags    = ["vyos-sg"]
    },
    coredns_prom_exporter_sg = {
      name    = "coredns-prom-exporter-sg"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "coredns-prometheus-exporter-sg"
      tags    = ["vyos-sg"]
    },
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
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "auth server"
      tags    = ["auth"]
    },
    vaultwarden = {
      name    = "vaultwarden"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
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
      name     = "area1"
      type     = "MX"
      content  = "asmtp.area1security.com"
      priority = 10
      ttl      = 1
      comment  = "area1 mx record"
      tags     = ["area1"]
      proxied  = false
    },
    area_1_mx_2 = {
      name     = "area1"
      type     = "MX"
      content  = "asmtp2.area1security.com"
      priority = 10
      ttl      = 1
      comment  = "area1 mx record"
      tags     = ["area1"]
      proxied  = false
    },
    area_1_mx_3 = {
      name     = "area1"
      type     = "MX"
      content  = "asmtp3.area1security.com"
      priority = 10
      ttl      = 1
      comment  = "area1 mx record"
      tags     = ["area1"]
      proxied  = false
    },
    spf = {
      name    = "spf"
      type    = "TXT"
      content = "v=spf1 -all"
      ttl     = 1
      comment = "spf"
      proxied = false
    },
    _dmarc = {
      name    = "_dmarc"
      type    = "TXT"
      content = "v=DMARC1; p=reject;"
      ttl     = 1
      comment = "dmarc policy"
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
      type    = "CNAME"
      content = "storage.googleapis.com"
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
    discord = {
      name    = "discord"
      type    = "CNAME"
      content = "discord.com"
      proxied = true
      ttl     = 1
      comment = "discord"
      tags    = ["discord"]
    },
    tldraw = {
      name    = "tldraw"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "drawing"
      tags    = ["tldraw"]
    },
    tunnel = {
      name    = "tunnel"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "zero trust tunnel"
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
    www = {
      name    = "www"
      type    = "CNAME"
      content = var.domain_name
      proxied = true
      ttl     = 1
      comment = "www"
      tags    = ["www"]
    },
    # Add validation records, special-purpose records, etc.
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
  }

  # Add any complex records
  complex_records = {
    # DNS delegation records can go here if needed
  }
}

# Add other groups of DNS records as needed

