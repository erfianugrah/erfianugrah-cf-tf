resource "cloudflare_zero_trust_gateway_certificate" "cf_main" {
  account_id           = var.cloudflare_account_id
  activate             = true
  gateway_managed      = true
  validity_period_days = 1826
}
