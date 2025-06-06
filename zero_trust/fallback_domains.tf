resource "cloudflare_zero_trust_local_fallback_domain" "default" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_zero_trust_device_profiles.default.id
  dynamic "domains" {
    for_each = toset(["intranet", "internal", "private", "localdomain", "domain", "lan", "home", "host", "corp", "local", "localhost", "home.arpa", "invalid", "test"])
    content {
      suffix = domains.value
    }
  }

  domains {
    suffix     = "vyos1.lan"
    dns_server = ["10.68.69.1"]
  }
}

resource "cloudflare_zero_trust_local_fallback_domain" "google" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_zero_trust_device_profiles.google.id
  dynamic "domains" {
    for_each = toset(["intranet", "internal", "private", "localdomain", "domain", "lan", "home", "host", "corp", "local", "localhost", "home.arpa", "invalid", "test"])
    content {
      suffix = domains.value
    }
  }

  domains {
    suffix     = "vyos1.lan"
    dns_server = ["10.68.69.1"]
  }
}
