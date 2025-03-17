output "media_dns_records" {
  description = "Map of all media service DNS records"
  value       = module.media_dns.all_records
}

output "infra_dns_records" {
  description = "Map of all infrastructure DNS records"
  value       = module.infra_dns.all_records
}

output "infra_complex_records" {
  description = "Map of complex records in infrastructure DNS"
  value       = module.infra_dns.complex_records
}

output "media_certificates" {
  description = "Map of all media service certificates"
  value       = module.media_certs.certificates
}

output "infra_certificates" {
  description = "Map of all infrastructure certificates"
  value       = module.infra_certs.certificates
}

output "wildcard_certificate" {
  description = "Global wildcard certificate"
  value       = cloudflare_certificate_pack.wildcard
}

output "total_records" {
  description = "Total number of DNS records created"
  value = {
    media_records = module.media_dns.count_by_type
    infra_records = module.infra_dns.count_by_type
  }
}

output "total_certificates" {
  description = "Total number of certificates created"
  value = {
    media_certs = module.media_certs.certificate_count
    infra_certs = module.infra_certs.certificate_count
    wildcard    = 1
  }
}

output "records_by_type" {
  description = "All DNS records organized by type"
  value = {
    media = module.media_dns.records_by_type
    infra = module.infra_dns.records_by_type
  }
}