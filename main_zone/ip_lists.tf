resource "cloudflare_list" "erfi_ips" {
  account_id = var.cloudflare_account_id
  name       = "erfi_ips"
  kind       = "ip"

  item {
    value {
      ip = var.sg_ip
    }
    comment = "sg"
  }

  item {
    value {
      ip = var.nl_ip
    }
    comment = "nl"
  }
}

resource "cloudflare_list" "cf_ips" {
  account_id = var.cloudflare_account_id
  name       = "cf_ips"
  kind       = "ip"

  dynamic "item" {
    for_each = var.cf_ips
    content {
      value {
        ip = item.value
      }
    }
  }
}
