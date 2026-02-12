resource "cloudflare_spectrum_application" "coturn_tcp" {
  origin_direct  = ["tcp://${var.sg_ip}:3478"]
  protocol       = "tcp/3478"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "coturn.${var.domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}

resource "cloudflare_spectrum_application" "coturn_udp" {
  origin_direct  = ["udp://${var.sg_ip}:3478"]
  protocol       = "udp/3478"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "coturn.${var.domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}

resource "cloudflare_spectrum_application" "coturn_tcp_tls" {
  origin_direct  = ["tcp://${var.sg_ip}:5349"]
  protocol       = "tcp/5349"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "coturn.${var.domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}

resource "cloudflare_spectrum_application" "coturn_udp_tls" {
  origin_direct  = ["udp://${var.sg_ip}:5349"]
  protocol       = "udp/5349"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "coturn.${var.domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}

resource "cloudflare_spectrum_application" "coturn_ephemeral" {
  origin_direct  = ["udp://${var.sg_ip}:49152-65535"]
  protocol       = "udp/49152-65535"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "coturn.${var.domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}

resource "cloudflare_spectrum_application" "static_ip_test_1" {
  origin_direct  = ["tcp://${var.sg_ip}:7478"]
  protocol       = "tcp/7478"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "static1.${var.domain_name}"
    type = "ADDRESS"
  }
  edge_ips {
    # connectivity = "ipv4"
    type = "static"
    ips = [
      var.spectrum_static_v6_1,
      var.spectrum_static_v6_2
    ]
  }
}

resource "cloudflare_spectrum_application" "static_ip_test_2" {
  origin_direct  = ["udp://${var.sg_ip}:6478"]
  protocol       = "udp/6478"
  proxy_protocol = "v2"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.cloudflare_zone_id
  dns {
    name = "static1.${var.domain_name}"
    type = "ADDRESS"
  }
  edge_ips {
    # connectivity = "ipv4"
    type = "static"
    ips = [
      var.spectrum_static_v6_1,
      var.spectrum_static_v6_2
    ]
  }
}

resource "cloudflare_spectrum_application" "jitsi_jvb_udp" {
  origin_dns {
    name = "jitsi-lb.${var.thirdary_domain_name}"
  }
  origin_port    = 10000
  protocol       = "udp/10000"
  proxy_protocol = "off"
  tls            = "off"
  traffic_type   = "direct"
  zone_id        = var.thirdary_cloudflare_zone_id
  dns {
    name = "jitsi-udp.${var.thirdary_domain_name}"
    type = "CNAME"
  }
  edge_ips {
    connectivity = "ipv4"
    type         = "dynamic"
  }
}


