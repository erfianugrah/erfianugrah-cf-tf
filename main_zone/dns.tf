# DNS records for the primary zone (erfianugrah.com)
# Consolidated into a single module call for efficiency

module "primary_dns" {
  source = "./modules/dns_records"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  records = {
    # ── KVM Infrastructure ──────────────────────────────────────────────
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
      content = module.tunnel_kvm_nl.cname
      proxied = true
      ttl     = 1
      comment = "pikvm nl"
      tags    = ["kvm-nl"]
    },
    ssh_pikvm_sg = {
      name    = "ssh-pikvm-sg"
      type    = "CNAME"
      content = module.tunnel_kvm_sg.cname
      proxied = true
      ttl     = 1
      comment = "SSH access to pikvm sg"
      tags    = ["kvm-sg"]
    },
    ssh_pikvm_nl = {
      name    = "ssh-pikvm-nl"
      type    = "CNAME"
      content = module.tunnel_kvm_nl.cname
      proxied = true
      ttl     = 1
      comment = "SSH access to pikvm nl"
      tags    = ["kvm-nl"]
    },

    # ── VyOS Netherlands ────────────────────────────────────────────────
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
      content = module.tunnel_vyos_nl.cname
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
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "httpbun on vyos-nl"
      tags    = ["vyos-nl"]
    },
    pihole_vyos_nl = {
      name    = "pihole-vyos-nl"
      type    = "CNAME"
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "pihole-nl"
      tags    = ["vyos-nl"]
    },
    tpi = {
      name    = "tpi"
      type    = "CNAME"
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "turing pi BMC"
      tags    = ["k3s"]
    },
    prom_tunnel_nl = {
      name    = "prom-tunnel-nl"
      type    = "CNAME"
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "cfd node exporter"
      tags    = ["vyos-nl"]
    },
    prom_vyos_nl = {
      name    = "prom-vyos-nl"
      type    = "CNAME"
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "cfd node exporter"
      tags    = ["vyos-nl"]
    },

    # ── VyOS Singapore ──────────────────────────────────────────────────
    vyos_sg_ssh = {
      name    = "sg.vyos"
      type    = "CNAME"
      content = module.tunnel_vyos_sg.cname
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
      content = module.tunnel_vyos_sg.cname
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

    # ── Authentication ──────────────────────────────────────────────────
    keycloak = {
      name    = "keycloak"
      type    = "CNAME"
      content = module.tunnel_servarr.cname
      proxied = true
      ttl     = 1
      comment = "auth server"
      tags    = ["auth"]
    },

    # ── Email ───────────────────────────────────────────────────────────
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

    # ── Storage ─────────────────────────────────────────────────────────
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

    # ── Special Purpose ─────────────────────────────────────────────────
    atuin = {
      name    = "atuin"
      type    = "CNAME"
      content = module.tunnel_erfipie.cname
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
      content = module.tunnel_erfipie.cname
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
    prom_exporter_pi = {
      name    = "prom-exporter-pi"
      type    = "CNAME"
      content = module.tunnel_erfipie.cname
      proxied = true
      ttl     = 1
      comment = "erfipie node exporter"
      tags    = ["erfipie"]
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
    challenge = {
      name    = "challenge"
      type    = "AAAA"
      content = "100::"
      proxied = true
      ttl     = 1
      comment = "challenge record"
    },
    httpbun = {
      name    = "httpbun"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "httpbun"
    },

    # ── DNS Delegations ─────────────────────────────────────────────────
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
    },
  }
}

# ── Secondary Domain (erfi.dev) ───────────────────────────────────────
module "secondary_dns" {
  source = "./modules/dns_records"

  zone_id     = var.secondary_cloudflare_zone_id
  domain_name = var.secondary_domain_name

  records = {
    draw = {
      name    = "draw"
      type    = "CNAME"
      content = module.tunnel_erfipie.cname
      proxied = true
      ttl     = 1
      comment = "excalidraw"
      tags    = ["erfipie"]
    },
    uptime = {
      name    = "uptime"
      type    = "CNAME"
      content = module.tunnel_erfipie.cname
      proxied = true
      ttl     = 1
      comment = "uptime-kuma"
      tags    = ["erfipie"]
    },
  }
}

# ── Tertiary Domain (erfi.io) ───────────────────────────────────────
module "tertiary_dns" {
  source = "./modules/dns_records"

  zone_id     = var.tertiary_cloudflare_zone_id
  domain_name = var.tertiary_domain_name

  records = {
    gloryhole = {
      name    = "gloryhole"
      type    = "CNAME"
      content = module.tunnel_vyos_nl.cname
      proxied = true
      ttl     = 1
      comment = "gloryhole admin"
      tags    = ["vyos-nl"]
    },
    gloryhole-dot = {
      name    = "gloryhole-dot"
      type    = "A"
      content = var.nl_ip
      proxied = false
      ttl     = 1
      comment = "gloryhole DoT"
      tags    = ["vyos-nl"]
    },

    # ── Resend / SES Email ───────────────────────────────────────────────
    resend_dkim = {
      name    = "resend._domainkey"
      type    = "TXT"
      content = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1DAktzuNMaJZg20ouFgrqbANZ6m7Vuyy1M4WxpamycUcF2oux6s4sgJdpr8XciIfj961OOhRfba9L/KK/1oydDm1hrPSRwG0/pLsUzK5H6XCuvDjX8ncB71ahb7NRM4Qb6L0LMIeMWagLmV7ty+Fe3/9baiRchp2sU2o8+PMOVQIDAQAB"
      ttl     = 1
      comment = "resend DKIM"
      proxied = false
    },
    resend_mx = {
      name     = "send"
      type     = "MX"
      content  = "feedback-smtp.eu-west-1.amazonses.com"
      ttl      = 1
      comment  = "resend MX"
      proxied  = false
      priority = 10
    },
    resend_spf = {
      name    = "send"
      type    = "TXT"
      content = "v=spf1 include:amazonses.com ~all"
      ttl     = 1
      comment = "resend SPF"
      proxied = false
    },
    resend_dmarc = {
      name    = "_dmarc"
      type    = "TXT"
      content = "v=DMARC1; p=none;"
      ttl     = 1
      comment = "resend DMARC"
      proxied = false
    },
  }
}
