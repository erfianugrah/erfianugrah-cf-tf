resource "cloudflare_zero_trust_dns_location" "sg" {
  account_id     = var.cloudflare_account_id
  name           = "sg"
  client_default = false
  networks = [
    {
      network = "${var.sg_ip}/32"
    }
  ]
  endpoints {
    ipv4 {
      enabled = true
    }
    ipv6 {
      enabled = false
    }
    dot {
      enabled = true
    }
    doh {
      enabled = true
    }
  }
}

resource "cloudflare_zero_trust_dns_location" "nl" {
  account_id     = var.cloudflare_account_id
  name           = "nl"
  client_default = true
  networks = [
    {
      network = "${var.nl_ip}/32"
    }
  ]
  endpoints {
    ipv4 {
      enabled = true
    }
    ipv6 {
      enabled = false
    }
    dot {
      enabled = true
    }
    doh {
      enabled = true
    }
  }
}
