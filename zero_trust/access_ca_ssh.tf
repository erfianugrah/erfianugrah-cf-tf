# RETIRED 2026-09-05: commented out (argo tunnels retired) - see main_zone/tunnels.tf header.
# resource "cloudflare_zero_trust_access_short_lived_certificate" "miau" {
#   account_id     = var.cloudflare_account_id
#   application_id = cloudflare_zero_trust_access_application.erfipie_ssh.id
# }

# resource "cloudflare_zero_trust_access_short_lived_certificate" "vyos" {
#   account_id     = var.cloudflare_account_id
#   application_id = cloudflare_zero_trust_access_application.vyos_ssh.id
# }

# resource "cloudflare_zero_trust_access_short_lived_certificate" "proxmox" {
#   account_id     = var.cloudflare_account_id
#   application_id = cloudflare_zero_trust_access_application.proxmox_ssh.id
# }
