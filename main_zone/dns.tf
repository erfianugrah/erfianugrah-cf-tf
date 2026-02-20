# DNS records using the module approach
# This file replaces dns.tf by using the dns_records module

# Media Services Module (all servarr-tagged records)

# ProxMox Infrastructure Module - REMOVED
# Proxmox tunnel and DNS records removed during cleanup

# KVM Infrastructure Module
module "kvm_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
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
    # area_1_mx_1 = {
    #   name     = var.domain_name
    #   type     = "MX"
    #   content  = "mailstream-central.mxrecord.mx"
    #   priority = 50
    #   ttl      = 300
    #   comment  = "area 1"
    #   tags     = ["area1"]
    #   proxied  = false
    # },
    # area_1_mx_2 = {
    #   name     = var.domain_name
    #   type     = "MX"
    #   content  = "mailstream-west.mxrecord.io"
    #   priority = 10
    #   ttl      = 300
    #   comment  = "area 1"
    #   tags     = ["area1"]
    #   proxied  = false
    # },
    # area_1_mx_3 = {
    #   name     = var.domain_name
    #   type     = "MX"
    #   content  = "mailstream-east.mxrecord.io"
    #   priority = 10
    #   ttl      = 300
    #   comment  = "area 1"
    #   tags     = ["area1"]
    #   proxied  = false
    # },
    google_workspace = {
      name     = var.domain_name
      type     = "MX"
      content  = "smtp.google.com"
      ttl      = 3600
      comment  = "MX"
      proxied  = false
      priority = 1
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
    # tldraw = {
    #   name    = "draw"
    #   type    = "CNAME"
    #   content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
    #   proxied = true
    #   ttl     = 1
    #   comment = "drawing"
    #   tags    = ["tldraw"]
    # },
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
    # www_revista = {
    #   name    = "www"
    #   type    = "CNAME"
    #   content = var.pages_domain
    #   proxied = true
    #   ttl     = 1
    #   comment = "www"
    #   tags    = ["revista"]
    # },
    # acme_challenge_custom_hostname_2 = {
    #   name    = "_acme-challenge.custom-hostname-2"
    #   type    = "CNAME"
    #   content = "custom-hostname-2.${var.domain_name}.b63bf2e93a182db4.dcv.cloudflare.com"
    #   proxied = true
    #   ttl     = 1
    #   comment = "dcv delegation test"
    # },

    challenge = {
      name    = "challenge"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "challenge record"
    },
    # custom_hostname = {
    #   name    = "custom-hostname"
    #   type    = "CNAME"
    #   content = "httpbun.${var.domain_name}"
    #   proxied = true
    #   ttl     = 1
    #   comment = "custom hostname"
    # },
    # custom_hostname_2 = {
    #   name    = "custom-hostname-2"
    #   type    = "CNAME"
    #   content = "fallback.epikbahis175.com"
    #   proxied = false
    #   ttl     = 1
    #   comment = "custom hostname 2"
    # },
    httpbun = {
      name    = "httpbun"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "httpbun"
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

# Secondary Domain (erfi.dev) Services Module
module "secondary_dns" {
  source = "./modules/dns_records"

  zone_id     = var.secondary_cloudflare_zone_id
  domain_name = var.secondary_domain_name

  records = {
    draw = {
      name    = "draw"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "excalidraw"
      tags    = ["erfipie"]
    },
    uptime = {
      name    = "uptime"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.erfipie.cname
      proxied = true
      ttl     = 1
      comment = "uptime-kuma"
      tags    = ["erfipie"]
    },
    gloryhole = {
      name    = "gloryhole"
      type    = "CNAME"
      content = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "pihole admin"
      tags    = ["vyos-nl"]
    },
  }
}

# Add other groups of DNS records as needed

