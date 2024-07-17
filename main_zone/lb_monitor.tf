resource "cloudflare_load_balancer_monitor" "ssgs" {
  account_id       = var.cloudflare_account_id
  allow_insecure   = false
  consecutive_down = 5
  consecutive_up   = 0
  description      = "SSGs"
  expected_codes   = "200"
  follow_redirects = false
  interval         = 300
  method           = "GET"
  path             = "/"
  port             = 443
  retries          = 5
  timeout          = 5
  type             = "https"
}

resource "cloudflare_load_balancer_monitor" "revista" {
  account_id       = var.cloudflare_account_id
  allow_insecure   = false
  consecutive_down = 5
  consecutive_up   = 0
  description      = "revista"
  expected_codes   = "200"
  follow_redirects = false
  interval         = 300
  method           = "GET"
  path             = "/"
  port             = 443
  retries          = 5
  timeout          = 5
  type             = "https"
}

# resource "cloudflare_load_balancer_monitor" "authentik" {
#   account_id       = var.cloudflare_account_id
#   allow_insecure   = false
#   consecutive_down = 5
#   consecutive_up   = 0
#   description      = "authentik"
#   expected_codes   = "200"
#   follow_redirects = false
#   interval         = 300
#   method           = "GET"
#   path             = "/"
#   port             = 443
#   retries          = 5
#   timeout          = 5
#   type             = "https"
# }

resource "cloudflare_load_balancer_monitor" "httpbun" {
  account_id       = var.cloudflare_account_id
  allow_insecure   = false
  consecutive_down = 5
  consecutive_up   = 0
  description      = "httpbun"
  expected_codes   = "200"
  follow_redirects = false
  interval         = 300
  method           = "GET"
  path             = "/"
  port             = 9000
  retries          = 5
  timeout          = 5
  type             = "http"
}
