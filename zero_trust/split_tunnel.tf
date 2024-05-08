resource "cloudflare_split_tunnel" "default_include" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.default.id
  mode       = "include"
  tunnels {
    address     = "10.68.0.0/16"
    description = "Home"
  }
  tunnels {
    address     = "10.0.0.0/8"
    description = "Local"
  }
  tunnels {
    address     = "172.16.0.0/12"
    description = "docker-podman"
  }
}

resource "cloudflare_split_tunnel" "google_include" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.google.id
  mode       = "include"
  tunnels {
    address     = "10.68.0.0/16"
    description = "Home"
  }
  tunnels {
    address     = "10.0.0.0/8"
    description = "Local"
  }
  tunnels {
    address     = "172.16.0.0/12"
    description = "docker-podman"
  }
}
