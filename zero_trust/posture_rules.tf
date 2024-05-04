resource "cloudflare_device_posture_rule" "gateway" {
  account_id = var.cloudflare_account_id
  name       = "gateway_for_all"
  type       = "gateway"
  schedule   = "24h"
  expiration = "24h"
}

resource "cloudflare_device_posture_rule" "warp" {
  account_id = var.cloudflare_account_id
  name       = "warp_for_all"
  type       = "warp"
  schedule   = "24h"
  expiration = "24h"
}

resource "cloudflare_device_posture_rule" "new_windows" {
  account_id = var.cloudflare_account_id
  name       = "new_windows_version_check"
  type       = "os_version"
  schedule   = "24h"
  expiration = "24h"

  match {
    platform = "windows"
  }

  input {
    version  = "10.0.19044"
    operator = ">="
  }
}

resource "cloudflare_device_posture_rule" "old_windows" {
  account_id = var.cloudflare_account_id
  name       = "old_windows_version_check"
  type       = "os_version"
  schedule   = "24h"
  expiration = "24h"

  match {
    platform = "windows"
  }

  input {
    version  = "10.0.19044"
    operator = "<"
  }
}
