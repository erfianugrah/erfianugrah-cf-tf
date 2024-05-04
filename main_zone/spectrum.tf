resource "cloudflare_spectrum_application" "coturn_tcp" {
  origin_direct  = ["tcp://118.189.189.102:3478"]
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
  origin_direct  = ["udp://118.189.189.102:3478"]
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
  origin_direct  = ["tcp://118.189.189.102:5349"]
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
  origin_direct  = ["udp://118.189.189.102:5349"]
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
  origin_direct  = ["udp://118.189.189.102:49152-65535"]
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

# resource "cloudflare_spectrum_application" "same_hostname_test_1" {
#   origin_direct = ["tcp://118.189.189.102:443"]
#   protocol      = "tcp/443"
#   traffic_type  = "https"
#   zone_id       = var.cloudflare_zone_id
#   dns {
#     name = "test10.${var.domain_name}"
#     type = "CNAME"
#   }
#   edge_ips {
#     connectivity = "ipv4"
#     type         = "dynamic"
#   }
# }
#
# resource "cloudflare_spectrum_application" "same_hostname_test_2" {
#   origin_direct = ["tcp://195.240.81.42:443"]
#   protocol      = "tcp/443"
#   traffic_type  = "https"
#   zone_id       = var.cloudflare_zone_id
#   dns {
#     name = "test10.${var.domain_name}"
#     type = "CNAME"
#   }
#   edge_ips {
#     connectivity = "ipv4"
#     type         = "dynamic"
#   }
# }

# resource "cloudflare_spectrum_application" "terraform_managed_resource_74271365a6aa416bb980d01347f27119" {
#   origin_direct  = ["tcp://118.189.189.102:2054"]
#   protocol       = "tcp/443"
#   proxy_protocol = "off"
#   tls            = "full"
#   traffic_type   = "direct"
#   zone_id        = var.cloudflare_zone_id
#   dns {
#     name = "home.${var.domain_name}"
#     type = "CNAME"
#   }
#   edge_ips {
#     connectivity = "all"
#     type         = "dynamic"
#   }
# }

# resource "cloudflare_spectrum_application" "cf_coturn" {
#   ip_firewall    = true
#   origin_direct  = ["udp://127.0.0.1:3478"]
#   protocol       = "udp/50000"
#   proxy_protocol = "v2"
#   tls            = "off"
#   traffic_type   = "direct"
#   zone_id        = var.cloudflare_zone_id
#   dns {
#     name = "turn.${var.domain_name}"
#     type = "CNAME"
#   }
#   edge_ips {
#     connectivity = "all"
#     type         = "dynamic"
#   }
# }

