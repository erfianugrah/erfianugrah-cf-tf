# Certificate management using the certificate_packs module
#
# Modes:
#   "wildcard"  (default) — root + wildcard + auto multi-level wildcards
#   "per_host"  — Total TLS style, individual cert per record
#   "none"      — skip cert creation

# ── Primary zone (erfianugrah.com) ───────────────────────────────────
# Single module: wildcard covers all single-level subdomains,
# auto-detects multi-level parents (vyos, saas) for additional wildcards.
module "primary_certificates" {
  source = "./modules/certificate_packs"

  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name

  # Feed all primary-zone DNS records so multi-level subdomains are detected
  dns_records = module.primary_dns.records_for_certificates

  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# ── Thirdary zone (erfi.io) ─────────────────────────────────────────
# Media/servarr services — wildcard mode auto-detects admin.matrix → *.matrix
module "media_certificates" {
  source = "./modules/certificate_packs"

  zone_id     = var.tertiary_cloudflare_zone_id
  domain_name = var.tertiary_domain_name

  dns_records = module.media_dns.records_for_certificates

  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# ── Secondary zone (erfi.dev) ────────────────────────────────────────
module "secondary_certificates" {
  source = "./modules/certificate_packs"

  zone_id     = var.secondary_cloudflare_zone_id
  domain_name = var.secondary_domain_name

  dns_records = module.secondary_dns.records_for_certificates

  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Output summary
output "certificate_summary" {
  description = "Summary of all certificates created"
  value = {
    primary_certificates   = module.primary_certificates.certificate_count
    media_certificates     = module.media_certificates.certificate_count
    secondary_certificates = module.secondary_certificates.certificate_count
    total_certificates = (
      module.primary_certificates.certificate_count +
      module.media_certificates.certificate_count +
      module.secondary_certificates.certificate_count
    )
    primary_multi_level_parents = module.primary_certificates.multi_level_parents
    media_multi_level_parents   = module.media_certificates.multi_level_parents
  }
}
