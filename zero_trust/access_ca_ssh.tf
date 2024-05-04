resource "cloudflare_access_ca_certificate" "miau" {
  account_id     = var.cloudflare_account_id
  application_id = cloudflare_access_application.erfipie_ssh.id 
}
