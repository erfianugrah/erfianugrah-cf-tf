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
    "dcv.cloudflare.com",  # Standard Cloudflare DCV
    ".dcv.",               # Other DCV patterns
    "_acme-challenge",     # ACME challenge records
    ".acme.",              # Other ACME-related records
    "validation"           # Generic validation patterns
  ]
  
  # Function to check if a record is a DCV record
  is_dcv_record = function(record) {
    # For CNAME records, check if the content contains DCV patterns
    if record.type == "CNAME" && record.content != null {
      return anytrue([
        for pattern in local.dcv_patterns : 
        strcontains(record.content, pattern)
      ])
    }
    
    # For any record, check if the name contains DCV patterns
    return anytrue([
      for pattern in local.dcv_patterns : 
      strcontains(record.name, pattern)
    ])
  }
  
  # Extract A records that should have certificates (excluding DCV records)
  a_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && 
       v.type == "A" && 
       !local.is_dcv_record(v)
  }
  
  # Extract AAAA records that should have certificates (excluding DCV records)
  aaaa_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && 
       v.type == "AAAA" && 
       !local.is_dcv_record(v)
  }
  
  # Extract CNAME records that should have certificates (excluding DCV records)
  cname_records = {
    for k, v in var.dns_records : k => v
    if contains(var.cert_types, v.type) && 
       v.type == "CNAME" && 
       !local.is_dcv_record(v)
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
  
  # Optional parameter for waiting for active status
  wait_for_active_status = var.wait_for_active_status
}