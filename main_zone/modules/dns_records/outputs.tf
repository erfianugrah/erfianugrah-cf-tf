locals {
  all_records = merge(cloudflare_record.simple, cloudflare_record.complex)
}

output "all_records" {
  description = "Map of all created DNS records"
  value       = local.all_records
}

output "simple_records" {
  description = "Map of simple DNS records (using content field)"
  value       = cloudflare_record.simple
}

output "complex_records" {
  description = "Map of complex DNS records (using data block)"
  value       = cloudflare_record.complex
}

output "fqdns" {
  description = "Map of FQDNs for all created records"
  value = {
    for k, v in local.all_records : k => (
      v.name == var.domain_name || endswith(v.name, ".${var.domain_name}")
      ? v.name
      : "${v.name}.${var.domain_name}"
    )
  }
}

output "records_for_certificates" {
  description = "DNS records eligible for certificates (A, AAAA, CNAME)"
  value = {
    for k, v in local.all_records : k => v
    if contains(["A", "AAAA", "CNAME"], v.type)
  }
}
