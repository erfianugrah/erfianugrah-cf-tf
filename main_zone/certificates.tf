# Certificate management using the certificate_packs module
#
# Modes:
#   "wildcard"  (default) - root + wildcard + auto multi-level wildcards
#   "per_host"  - Total TLS style, individual cert per record
#   "none"      - skip cert creation
#
# NOTE: erfi.io (tertiary/media) is intentionally absent. It is a partial
# (CNAME) zone with authoritative DNS on Knot (knotea), so CF edge certs are
# unnecessary: non-proxied hosts never hit the CF edge (Caddy/Knot ACME serves
# them) and proxied hosts get Universal SSL auto-provisioned per hostname
# (HTTP DCV). The old advanced wildcard packs could only renew via TXT/delegated
# DCV and were the source of the recurring CF renewal-warning emails.

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
    secondary_certificates = module.secondary_certificates.certificate_count
    total_certificates = (
      module.primary_certificates.certificate_count +
      module.secondary_certificates.certificate_count
    )
    primary_multi_level_parents = module.primary_certificates.multi_level_parents
  }
}
