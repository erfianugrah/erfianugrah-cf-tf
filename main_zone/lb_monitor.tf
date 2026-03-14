resource "cloudflare_load_balancer_monitor" "httpbun_erfipie" {
  account_id       = var.cloudflare_account_id
  allow_insecure   = false
  consecutive_down = 5
  consecutive_up   = 0
  description      = "httpbun_erfipie"
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

resource "cloudflare_load_balancer_monitor" "vaultwarden" {
  account_id       = var.cloudflare_account_id
  allow_insecure   = false
  consecutive_down = 3
  consecutive_up   = 2
  description      = "vaultwarden"
  expected_codes   = "200"
  follow_redirects = false
  interval         = 60
  method           = "GET"
  path             = "/alive"
  port             = 443
  retries          = 2
  timeout          = 5
  type             = "https"
  header {
    header = "Host"
    values = ["vault.${var.tertiary_domain_name}"]
  }
}

resource "cloudflare_load_balancer_monitor" "jitsi" {
  account_id       = var.cloudflare_account_id
  consecutive_down = 5
  consecutive_up   = 0
  description      = "jitsi_jvb_udp"
  interval         = 60
  retries          = 2
  timeout          = 3
  type             = "icmp_ping"
}
