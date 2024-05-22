resource "cloudflare_teams_proxy_endpoint" "nl_proxy_endpoint" {
  account_id = var.cloudflare_account_id
  name       = "nl"
  ips        = ["${var.nl_ip}/32"]
}

resource "cloudflare_teams_proxy_endpoint" "sg_proxy_endpoint" {
  account_id = var.cloudflare_account_id
  name       = "sg"
  ips        = ["${var.sg_ip}/32"]
}

