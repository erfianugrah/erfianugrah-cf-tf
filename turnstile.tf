resource "cloudflare_turnstile_widget" "authentik" {
  account_id     = var.cloudflare_account_id
  name           = "Authentik"
#   bot_fight_mode = true
#   offlabel       = true
  domains        = [var.domain_name]
  mode           = "managed"
  region         = "world"
}

resource "cloudflare_turnstile_widget" "interstitial" {
  account_id     = var.cloudflare_account_id
  name           = "Interstitial Turnstile"
#   bot_fight_mode = true
#   offlabel       = true
  domains        = [var.domain_name]
  mode           = "managed"
  region         = "world"
}
