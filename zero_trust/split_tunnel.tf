resource "cloudflare_split_tunnel" "default_exclude" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.default.id
  mode       = "exclude"
  tunnels {
    address     = "10.0.69.3/32"
    description = "Home"
  }
  tunnels {
    address     = "172.18.0.2/32"
    description = "pihole"
  }
  tunnels {
    address     = "10.68.73.2/32"
    description = "pve"
  }
}

resource "cloudflare_split_tunnel" "google_exclude" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.google.id
  mode       = "exclude"
  tunnels {
    address     = "10.0.69.3/32"
    description = "Home"
  }
  tunnels {
    address     = "172.18.0.2/32"
    description = "pihole"
  }
  tunnels {
    address     = "10.68.73.2/32"
    description = "pve"
  }
}
