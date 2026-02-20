locals {
  # ── DCV patterns to exclude ────────────────────────────────────────
  dcv_patterns = [
    "dcv.cloudflare.com",
    ".dcv.",
    "_acme-challenge",
    ".acme.",
    "validation",
  ]

  # ── Filter eligible records (A/AAAA/CNAME, no DCV) ────────────────
  eligible_records = {
    for k, v in var.dns_records : k => {
      name = v.name
      type = v.type
    }
    if contains(var.cert_types, v.type) &&
    !anytrue([for pattern in local.dcv_patterns : strcontains(v.name, pattern)]) &&
    !contains(var.exclude_from_per_host, k)
  }

  # ── Detect multi-level subdomains ──────────────────────────────────
  # A record name like "nl.vyos" has a dot → parent is "vyos"
  # We collect unique parent subdomain segments for wildcard generation
  multi_level_parents = distinct(concat(
    [
      for k, v in local.eligible_records : join(".", slice(split(".", v.name), 1, length(split(".", v.name))))
      if length(regexall("\\.", v.name)) > 0
    ],
    var.additional_wildcards
  ))

  # ── Mode: wildcard ─────────────────────────────────────────────────
  # Root + wildcard + per-parent wildcards for multi-level subdomains
  wildcard_certs = var.mode == "wildcard" ? merge(
    # Base: root + wildcard
    {
      root_wildcard = {
        hosts   = [var.domain_name, "*.${var.domain_name}"]
        zone_id = var.zone_id
      }
    },
    # Multi-level: wildcard per parent subdomain
    {
      for parent in local.multi_level_parents : "wildcard_${replace(parent, ".", "_")}" => {
        hosts   = ["*.${parent}.${var.domain_name}"]
        zone_id = var.zone_id
      }
    }
  ) : {}

  # ── Mode: per_host (Total TLS style) ──────────────────────────────
  per_host_certs = var.mode == "per_host" ? {
    for k, v in local.eligible_records : k => {
      hosts   = ["${v.name}.${var.domain_name}"]
      zone_id = var.zone_id
    }
  } : {}

  # ── Final cert map ─────────────────────────────────────────────────
  all_certificate_hosts = var.mode == "wildcard" ? local.wildcard_certs : local.per_host_certs
}

# Create certificate packs
resource "cloudflare_certificate_pack" "certs" {
  for_each              = local.all_certificate_hosts
  certificate_authority = var.certificate_authority
  cloudflare_branding   = false
  hosts                 = each.value.hosts
  type                  = "advanced"
  validation_method     = var.validation_method
  validity_days         = var.validity_days
  zone_id               = each.value.zone_id

  wait_for_active_status = var.wait_for_active_status
}
