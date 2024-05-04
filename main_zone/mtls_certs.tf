resource "cloudflare_mtls_certificate" "httpbun" {
  account_id   = var.cloudflare_account_id
  name         = "httpbun"
  certificates = local.httpbun_ca_pem
  private_key  = local.httpbun_ca_key
  ca           = true
}