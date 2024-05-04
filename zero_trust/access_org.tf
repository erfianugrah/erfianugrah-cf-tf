resource "cloudflare_access_organization" "miau" {
  account_id                         = var.cloudflare_account_id
  name                               = "Miau"
  auth_domain                        = "erfianugrah.cloudflareaccess.com"
  is_ui_read_only                    = false
  user_seat_expiration_inactive_time = "1460h"
  auto_redirect_to_identity          = false
  session_duration                   = "24h"
  warp_auth_session_duration         = "24h"
}

