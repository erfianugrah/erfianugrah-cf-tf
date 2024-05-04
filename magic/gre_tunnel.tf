resource "cloudflare_gre_tunnel" "vyos_sg" {
  account_id              = var.cloudflare_account_id
  name                    = "vyos_sg"
  customer_gre_endpoint   = var.sg_ip
  cloudflare_gre_endpoint = var.wan_ip_1
  interface_address       = "10.68.88.21/31"
  description             = "vyos_sg_gre"
  ttl                     = 64
  mtu                     = 1476
  health_check_enabled    = true
  health_check_target     = var.sg_ip
  health_check_type       = "request"
}

resource "cloudflare_gre_tunnel" "vyos_nl" {
  account_id              = var.cloudflare_account_id
  name                    = "vyos_nl"
  customer_gre_endpoint   = var.nl_ip
  cloudflare_gre_endpoint = var.wan_ip_1
  interface_address       = "10.68.99.21/31"
  description             = "vyos_nl_gre"
  ttl                     = 64
  mtu                     = 1476
  health_check_enabled    = true
  health_check_target     = var.nl_ip
  health_check_type       = "request"
}
