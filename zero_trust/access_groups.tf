resource "cloudflare_zero_trust_access_group" "erfi_corp" {
  account_id = var.cloudflare_account_id
  name       = "Erfi Corp"
  include {
    email = var.erfi_corp
  }
}

resource "cloudflare_zero_trust_access_group" "unker" {
  account_id = var.cloudflare_account_id
  name       = "Unker Group"
  include {
    email = var.unker
  }
}

resource "cloudflare_zero_trust_access_group" "hadrian_corp" {
  account_id = var.cloudflare_account_id
  name       = "Hadrian Corp"
  include {
    email_domain = var.hadrian_corp
  }
}

resource "cloudflare_zero_trust_access_group" "cf_corp" {
  account_id = var.cloudflare_account_id
  name       = "Cloudflare Corp"
  include {
    email_domain = var.cf_corp
  }
}
