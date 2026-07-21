# Certificate management using the certificate_packs module
#
# Modes:
#   "wildcard"  (default) - root + wildcard + auto multi-level wildcards
#   "per_host"  - Total TLS style, individual cert per record
#   "none"      - skip cert creation
#
# NOTE: erfi.io (tertiary/media) is intentionally absent. It is a partial
# (CNAME) zone with authoritative DNS on Knot (knotea). Universal SSL is
# disabled on the zone; edge coverage comes from per-hostname advanced packs
# + Total TLS. Because the A records point at the home IP (only AAAA reaches
# CF), CF cannot complete HTTP or TXT DCV by itself - renewal depends on
# Delegated DCV: one `_acme-challenge.<host>` CNAME per certified host,
# pointing at `<host>.erfi.io.40a540432608c112.dcv.cloudflare.com`.
# Those CNAMEs live in ~/knotea/authority/zones/erfi.io.yml (applied with
# `knotctl apply`; the file is gitignored as live zone state). If CF renewal
# emails resume, check that a delegation CNAME exists for the named host and
# that the zone DCV UUID (GET /zones/:id/dcv_delegation/uuid) is unchanged.

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
