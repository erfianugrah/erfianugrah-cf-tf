resource "cloudflare_teams_location" "sg_gateway" {
  account_id     = var.cloudflare_account_id
  name           = "sg"
  client_default = false
  networks {
    network = "${var.sg_ip}/32"
  }
}

resource "cloudflare_teams_location" "nl_gateway" {
  account_id     = var.cloudflare_account_id
  name           = "nl"
  client_default = true

  networks {
    network = "${var.nl_ip}/32"
  }
}
