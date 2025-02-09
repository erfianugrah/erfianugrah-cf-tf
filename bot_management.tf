resource "cloudflare_bot_management" "bot_ent" {
  zone_id                   = var.cloudflare_zone_id
  enable_js                 = true
  auto_update_model         = true
  suppress_session_score    = false
}