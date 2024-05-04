resource "cloudflare_device_settings_policy" "default" {
  account_id            = var.cloudflare_account_id
  name                  = "default"
  description           = "default_policy"
  # precedence            = 100
  # match                 = "any(identity.groups.name[*] in {\"Erfi Corp\"})"
  default               = true
  enabled               = true
  allow_mode_switch     = true
  allow_updates         = true
  allowed_to_leave      = true
  auto_connect          = 0
  captive_portal        = 180
  disable_auto_fallback = false
  switch_locked         = false
  service_mode_v2_mode  = "warp"
  service_mode_v2_port  = 3000
  exclude_office_ips    = true
}

resource "cloudflare_device_settings_policy" "google" {
  account_id            = var.cloudflare_account_id
  name                  = "Google Workspace"
  description           = "google_workspace_policy"
  precedence            = 200
  match                 = "any(identity.groups.name[*] in {\"Erfi Corp\"})"
  default               = false
  enabled               = true
  allow_mode_switch     = true
  allow_updates         = true
  allowed_to_leave      = true
  auto_connect          = 0
  captive_portal        = 180
  disable_auto_fallback = false
  switch_locked         = false
  service_mode_v2_mode  = "warp"
  service_mode_v2_port  = 3000
  exclude_office_ips    = true
}