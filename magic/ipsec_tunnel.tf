resource "cloudflare_ipsec_tunnel" "vyos_sg_ipsec" {
  account_id           = var.cloudflare_account_id
  name                 = "vyos_sg_ipsec"
  customer_endpoint    = var.sg_ip
  cloudflare_endpoint  = var.wan_ip_2
  interface_address    = "10.68.77.21/31"
  description          = "vyos_sg_ipsec_m1"
  health_check_enabled = true
  health_check_target  = var.sg_ip
  health_check_type    = "request"
  psk                  = var.psk_sg
  allow_null_cipher    = false
  hex_id               = var.hex_id_sg
  fqdn_id              = var.fqdn_id_sg
  user_id              = var.user_id_sg
}

resource "cloudflare_ipsec_tunnel" "vyos_nl_ipsec" {
  account_id           = var.cloudflare_account_id
  name                 = "vyos_nl_ipsec"
  customer_endpoint    = var.nl_ip
  cloudflare_endpoint  = var.wan_ip_2
  interface_address    = "10.68.100.21/31"
  description          = "vyos_sg_ipsec_kpn"
  health_check_enabled = true
  health_check_target  = var.nl_ip
  health_check_type    = "request"
  psk                  = var.psk_nl
  allow_null_cipher    = false
  hex_id               = var.hex_id_nl
  fqdn_id              = var.fqdn_id_nl
  user_id              = var.user_id_nl
}
