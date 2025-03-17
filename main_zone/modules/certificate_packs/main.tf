locals {
  # Create base wildcard certificate config if enabled
  base_cert = var.create_wildcard_cert ? {
    main_domain = {
      hosts   = [var.domain_name, "*.${var.domain_name}"]
      zone_id = var.zone_id
    }
  } : {}
  
  # Extract A records that should have certificates
  a_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && v.type == "A"
  }
  
  # Extract AAAA records that should have certificates
  aaaa_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && v.type == "AAAA"
  }
  
  # Extract CNAME records that should have certificates
  cname_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && v.type == "CNAME"
  }
  
  # Combine all records that need certificates
  all_cert_records = merge(local.a_records, local.aaaa_records, local.cname_records)
  
  # Create certificate configs for each record
  record_certs = {
    for k, v in local.all_cert_records : k => {
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
}