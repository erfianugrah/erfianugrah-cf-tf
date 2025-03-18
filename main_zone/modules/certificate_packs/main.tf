locals {
  # Create base wildcard certificate config if enabled
  base_cert = var.create_wildcard_cert ? {
    main_domain = {
      hosts   = [var.domain_name, "*.${var.domain_name}"]
      zone_id = var.zone_id
    }
  } : {}

  # DCV (Domain Control Validation) patterns to exclude from certification
  dcv_patterns = [
    "dcv.cloudflare.com",
    ".dcv.",
    "_acme-challenge",
    ".acme.",
    "validation"
  ]

  # Extract record name safely without accessing potentially sensitive content
  safe_records = {
    for k, v in var.dns_records : k => {
      name = v.name
      type = v.type
      # Avoid using content directly to prevent sensitivity issues
    }
  }

  # Filter DNS records to exclude DCV records
  filtered_records = {
    for k, v in local.safe_records : k => v
    if contains(var.cert_types, v.type) &&
    !anytrue([for pattern in local.dcv_patterns : strcontains(v.name, pattern)])
  }

  # Create certificate configs for each filtered record
  record_certs = {
    for k, v in local.filtered_records : k => {
      hosts   = ["${v.name}.${var.domain_name}"]
      zone_id = var.zone_id
    }
  }

  # Combine base wildcard cert with individual record certs
  all_certificate_hosts = merge(local.base_cert, local.record_certs)
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