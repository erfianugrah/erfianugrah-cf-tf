resource "cloudflare_access_group" "erfi_corp" {
  account_id = var.cloudflare_account_id
  name       = "Erfi Corp"
  include {
    email = var.erfi_corp
  }
}

resource "cloudflare_access_group" "unker" {
  account_id = var.cloudflare_account_id
  name       = "Unker Group"
  include {
    email = var.unker
  }
}

