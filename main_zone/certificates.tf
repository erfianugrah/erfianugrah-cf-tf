# Certificate management using the module approach
# This file replaces certificate_pack.tf by using the certificate_packs module

# Base wildcard certificate for the domain
module "base_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = true
  
  # No specific DNS records needed for this - just the wildcard cert
  dns_records = {}
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Media service certificates
module "media_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  
  # Use the records_for_certificates output from the media DNS module
  dns_records = module.media_dns.records_for_certificates
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Infrastructure service certificates
module "infrastructure_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  
  # Combine infrastructure DNS records
  dns_records = merge(
    module.proxmox_dns.records_for_certificates,
    module.vyos_nl_dns.records_for_certificates,
    module.vyos_sg_dns.records_for_certificates
  )
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Authentication service certificates
module "auth_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  
  dns_records = module.auth_dns.records_for_certificates
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Storage service certificates
module "storage_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  
  dns_records = module.storage_dns.records_for_certificates
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Special service certificates
module "special_certificates" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  
  dns_records = module.special_dns.records_for_certificates
  
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Output summary of certificates
output "certificate_summary" {
  description = "Summary of all certificates created"
  value = {
    base_certificates = module.base_certificates.certificate_count
    media_certificates = module.media_certificates.certificate_count
    infrastructure_certificates = module.infrastructure_certificates.certificate_count
    auth_certificates = module.auth_certificates.certificate_count
    storage_certificates = module.storage_certificates.certificate_count
    special_certificates = module.special_certificates.certificate_count
    total_certificates = (
      module.base_certificates.certificate_count +
      module.media_certificates.certificate_count +
      module.infrastructure_certificates.certificate_count +
      module.auth_certificates.certificate_count +
      module.storage_certificates.certificate_count +
      module.special_certificates.certificate_count
    )
  }
}