resource "cloudflare_record" "bazarr" {
  comment = "subs"
  name    = "bazarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "beets" {
  comment = "tagging music"
  name    = "beets"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "caddy-prometheus" {
  comment = "caddy-monitoring"
  name    = "caddy-prometheus"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "caddy-api" {
  comment = "caddy-api"
  name    = "caddy"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "cadvisor" {
  comment = "docker monitoring"
  name    = "cadvisor"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "change" {
  comment = "site crawler for changes"
  name    = "change"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "coredns-prom-exporter-nl" {
  comment = "monitoring for coredns"
  name    = "coredns-prom-exporter-nl"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "coredns-prom-exporter-sg" {
  comment = "monitoring for coredns"
  name    = "coredns-prom-exporter-sg"
  proxied = true
  tags    = ["vyos-sg"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "dillinger" {
  comment = "in-browser markdown note taking app"
  name    = "dillinger"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "element" {
  comment = "web app for matrix"
  name    = "element"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "file" {
  comment = "file browser"
  name    = "file"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "fileservarr" {
  comment = "fileservarr"
  name    = "fileservarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "firefly" {
  comment = "daily expenses app"
  name    = "firefly"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "grafana-loki" {
  comment = "monitoring"
  name    = "grafana-loki"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "grafana-unraid" {
  comment = "grafana instance on unraid"
  name    = "grafana-unraid"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "hedgedoc" {
  comment = "real-time collaboration markdown note app"
  name    = "hedgedoc"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "httpbin" {
  comment = "httpbin"
  name    = "httpbin"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "httpbun-nl" {
  comment = "httpbun on vyos-nl"
  name    = "httpbun-nl"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "hydra" {
  comment = "usenet indexer aggregator"
  name    = "hydra"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ihatemoney" {
  comment = "collaborative expense app"
  name    = "ihatemoney"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "immich" {
  comment = "self-hosted google photos"
  name    = "immich"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "jackett" {
  comment = "indexer"
  name    = "jackett"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "jellyfin" {
  comment = "like plex but not"
  name    = "jellyfin"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "joplin" {
  comment = "notes"
  name    = "joplin"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "keycloak" {
  comment = "keycloak IDP"
  name    = "keycloak"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "kvm" {
  comment = "pikvm"
  name    = "kvm"
  proxied = true
  tags    = ["kvm-sg"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "navidrome" {
  comment = "music"
  name    = "navidrome"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "nodered" {
  comment = "nodered"
  name    = "nodered"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "overseerr" {
  comment = "overseerr"
  name    = "overseerr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "pihole-vyos-nl" {
  comment = "pihole"
  name    = "pihole-vyos-nl"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ping" {
  comment = "check IP"
  name    = "ping"
  proxied = false
  tags    = ["vyos-sg"]
  ttl     = 60
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "plex" {
  comment = "plex"
  name    = "plex"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "portainer" {
  comment = "portainer sg on unraid"
  name    = "port"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.servarr.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "privatebin" {
  comment = "privatebin"
  name    = "privatebin"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prom-unraid" {
  comment = "prometheus"
  name    = "prom-unraid"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prowlarr" {
  comment = "indexer"
  name    = "prowlarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "qbit" {
  comment = "qbit"
  name    = "qbit"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "qdirstat" {
  comment = "directory file analyser"
  name    = "qdirstat"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "radarr" {
  comment = "radarr"
  name    = "radarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "rclone" {
  comment = "rclone"
  name    = "rclone"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "sabnzbd" {
  comment = "usenet"
  name    = "sabnzbd"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "servarr" {
  comment = "unraid admin"
  name    = "servarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.servarr.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "sonarr" {
  comment = "sonarr"
  name    = "sonarr"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "synapse-admin" {
  comment = "synapse-admin"
  name    = "synapse-admin"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "synapse" {
  comment = "synapse"
  name    = "synapse"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "tautulli" {
  comment = "plex usage"
  name    = "tautulli"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "tpi" {
  comment = "turing pi BMC"
  name    = "tpi"
  proxied = true
  tags    = ["k3s"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "vaultwarden" {
  comment = "bitwarden"
  name    = "vaultwarden"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "vyos-fileservarr" {
  comment = "vyos-fileservarr"
  name    = "vyos-fileservarr"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "vyos-node-exporter" {
  comment = "vyos-node-exporter"
  name    = "vyos-node-exporter"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "A"
  value   = var.nl_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "r2" {
  comment = "r2 custom domain test"
  name    = "r2"
  proxied = true
  tags    = ["r2"]
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.cloudflare_zone_id
}
resource "cloudflare_record" "acme_challenge_custom_hostname_2" {
  comment = "dcv delegation test"
  name    = "_acme-challenge.custom-hostname-2"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "custom-hostname-2.${var.domain_name}.b63bf2e93a182db4.dcv.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}
resource "cloudflare_record" "coffee_test" {
  name    = "coffee.test"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "coffee-time.pages.dev"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "custom-hostname-2" {
  name    = "custom-hostname-2"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "fallback.epikbahis175.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "httpbun" {
  name    = "httpbun"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "custom-hostname" {
  name    = "custom-hostname"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "httpbun.${var.domain_name}"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "docs" {
  name    = "docs"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "erfi-docs.pages.dev"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "gcs" {
  comment = "signed requests test"
  name    = "gcs"
  proxied = true
  tags    = ["gcs"]
  ttl     = 1
  type    = "CNAME"
  value   = "storage.googleapis.com"
  zone_id = var.cloudflare_zone_id
}
resource "cloudflare_record" "area_1_mx_1" {
  comment  = "area 1"
  name     = var.domain_name
  priority = 50
  proxied  = false
  tags     = ["area1"]
  ttl      = 300
  type     = "MX"
  value    = "mailstream-central.mxrecord.mx"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "area_1_mx_2" {
  comment  = "area 1"
  name     = var.domain_name
  priority = 10
  proxied  = false
  tags     = ["area1"]
  ttl      = 300
  type     = "MX"
  value    = "mailstream-west.mxrecord.io"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "area_1_mx_3" {
  comment  = "area 1"
  name     = var.domain_name
  priority = 10
  proxied  = false
  tags     = ["area1"]
  ttl      = 300
  type     = "MX"
  value    = "mailstream-east.mxrecord.io"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_record" "best_delegation_1" {
  name    = "best"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "lola.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "best_delegation_2" {
  name    = "best"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "jeremy.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "dev_saas_delegation_1" {
  name    = "dev.saas"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "lola.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "dev_saas_delegation_2" {
  name    = "dev.saas"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "jeremy.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "erfiplan_delegation_1" {
  name    = "erfiplan"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "vicky.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "erfiplan_delegation_2" {
  name    = "erfiplan"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "monika.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "freeplan_delegation_1" {
  name    = "freeplan"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "lola.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "freeplan_delegation_2" {
  name    = "freeplan"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "jeremy.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prod_saas_delegation_1" {
  name    = "prod.saas"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "lola.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prod_saas_delegation_2" {
  name    = "prod.saas"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "jeremy.ns.cloudflare.com"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine; rua=mailto:e764748fc3894bf4bbae2a91ea79b3d2@dmarc-reports.cloudflare.net,mailto:iam@${var.domain_name}"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "spf" {
  name    = var.domain_name
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com -all"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "google_txt" {
  name    = var.domain_name
  proxied = false
  ttl     = 3600
  type    = "TXT"
  value   = "google-site-verification=7_N_bCOCpjU9g0Ii93cVDwZLZU1YoFukRgOpHiZSYmo"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "challenge" {
  name    = "challenge"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "gcs-fetch-test" {
  name    = "gcs-fetch-test"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "tunnel" {
  name    = "tunnel"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "whatami" {
  name    = "whatami"
  proxied = true
  ttl     = 1
  type    = "AAAA"
  value   = "100::"
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "kvm-nl" {
  comment = "pikvm nl"
  name    = "kvm-nl"
  proxied = true
  tags    = ["kvm-nl"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.kvm_nl.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "erfipie" {
  comment = "erfipie short-lived-cert ssh"
  name    = "pie"
  proxied = true
  tags    = ["erfipie"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.erfipie.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "pihole-vyos-sg" {
  comment = "pihole on vyos"
  name    = "pihole-vyos-sg"
  proxied = true
  tags    = ["vyos-sg"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.vyos_sg.cname
  zone_id = var.cloudflare_zone_id
}


resource "cloudflare_record" "prom-caddy-nl" {
  comment = "caddy on vyos-nl"
  name    = "prom-caddy-nl"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.vyos_nl.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prom-caddy-sg" {
  comment = "caddy on unraid"
  name    = "prom-caddy-sg"
  proxied = true
  tags    = ["servarr"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.servarr.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prom-exporter-pi" {
  comment = "erfipie node exporter"
  name    = "prom-exporter-pi"
  proxied = true
  tags    = ["erfipie"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.erfipie.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "prom-tunnel-nl" {
  comment = "cfd node exporter"
  name    = "prom-tunnel-nl"
  proxied = true
  tags    = ["vyos-nl"]
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.vyos_nl.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ssh-pikvm-sg" {
  name    = "ssh-pikvm-sg"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.kvm_sg.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ssh-pikvm-nl" {
  name    = "ssh-pikvm-nl"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.kvm_nl.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ollama" {
  name    = "ollama"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "ollama-ui" {
  name    = "ollama-ui"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = var.sg_ip
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "vyos-ssh-nl" {
  name    = "vyos-ssh"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.vyos_nl.cname
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "proxmox" {
  name    = "proxmox"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.proxmox.cname 
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "proxmox-ssh" {
  name    = "proxmox-ssh"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.proxmox.cname 
  zone_id = var.cloudflare_zone_id
}
