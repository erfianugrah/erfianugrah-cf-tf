# Delegated DCV helpers for partial (CNAME setup) zones.
#
# Only erfi.io is partial with authoritative DNS on Knot. Other zones stay
# fully authoritative on Cloudflare and do not need delegated DCV CNAMEs.

data "cloudflare_dcv_delegation" "tertiary" {
  zone_id = var.tertiary_cloudflare_zone_id
}

locals {
  # erfi.io cert coverage comes from tertiary + media cert modules.
  tertiary_certificate_hosts = concat(
    flatten(values(module.media_certificates.certificate_hosts)),
    flatten(values(module.tertiary_certificates.certificate_hosts))
  )

  # Cloudflare expects delegation on concrete hostnames (no leading *.).
  tertiary_dcv_validation_hosts = sort(distinct([
    for host in local.tertiary_certificate_hosts : trimsuffix(trimprefix(host, "*."), ".")
  ]))

  # CNAMEs to create in Knot for delegated DCV auto-renewal.
  delegated_dcv_cname_records = {
    tertiary = {
      for host in local.tertiary_dcv_validation_hosts :
      "_acme-challenge.${host}" => "${host}.${data.cloudflare_dcv_delegation.tertiary.hostname}"
    }
  }
}

output "delegated_dcv_cname_records" {
  description = "CNAME records that must exist in authoritative DNS (Knot) for Delegated DCV auto-renewal"
  value       = local.delegated_dcv_cname_records
  sensitive   = true
}
