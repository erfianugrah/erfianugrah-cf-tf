resource "cloudflare_list" "erfi_ips" {
  account_id = var.cloudflare_account_id
  name       = "erfi_ips"
  kind       = "ip"

  item {
    value {
      ip = "118.189.189.102"
    }
    comment = "sg"
  }

  item {
    value {
      ip = "195.240.81.42"
    }
    comment = "nl"
  }
}

resource "cloudflare_list" "cf_ips" {
  account_id = var.cloudflare_account_id
  name       = "cf_ips"
  kind       = "ip"

  item {
    value {
      ip = "103.21.244.0/22"
    }
  }

  item {
    value {
      ip = "103.22.200.0/22"
    }
  }
  item {
    value {
      ip = "103.31.4.0/22"
    }
  }
  item {
    value {
      ip = "104.16.0.0/13"
    }
  }
  item {
    value {
      ip = "104.24.0.0/14"
    }
  }
  item {
    value {
      ip = "108.162.192.0/18"
    }
  }
  item {
    value {
      ip = "131.0.72.0/22"
    }
  }
  item {
    value {
      ip = "141.101.64.0/18"
    }
  }
  item {
    value {
      ip = "162.158.0.0/15"
    }
  }
  item {
    value {
      ip = "172.64.0.0/13"
    }
  }
  item {
    value {
      ip = "173.245.48.0/20"
    }
  }
  item {
    value {
      ip = "188.114.96.0/20"
    }
  }
  item {
    value {
      ip = "190.93.240.0/20"
    }
  }
  item {
    value {
      ip = "197.234.240.0/22"
    }
  }
  item {
    value {
      ip = "198.41.128.0/17"
    }
  }
  item {
    value {
      ip = "2400:cb00::/32"
    }
  }
  item {
    value {
      ip = "2405:8100::/32"
    }
  }
  item {
    value {
      ip = "2405:b500::/32"
    }
  }
  item {
    value {
      ip = "2606:4700::/32"
    }
  }

  item {
    value {
      ip = "2803:f800::/32"
    }
  }
  item {
    value {
      ip = "2a06:98c0::/29"
    }
  }
  item {
    value {
      ip = "2c0f:f248::/32"
    }
  }
}
