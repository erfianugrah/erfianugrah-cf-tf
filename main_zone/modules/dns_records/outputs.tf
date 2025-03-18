locals {
  # Combine all records for easier output handling
  all_records = merge(cloudflare_record.simple, cloudflare_record.complex)

  # Define all DNS record types for better organization
  record_types = [
    "A", "AAAA", "CNAME", "TXT", "MX", "SRV", "SPF", "NS", "PTR",
    "CAA", "CERT", "DNSKEY", "DS", "NAPTR", "SMIMEA", "SSHFP",
    "TLSA", "URI", "LOC", "HTTPS", "SVCB"
  ]
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
    for k, v in local.all_records : k => "${v.name}.${var.domain_name}"
  }
}

output "records_by_type" {
  description = "Maps of records grouped by record type"
  value = {
    for type in local.record_types : "${lower(type)}_records" => {
      for k, v in local.all_records : k => v
      if v.type == type
    }
    if length([for k, v in local.all_records : v if v.type == type]) > 0
  }
}

output "count_by_type" {
  description = "Count of records by type"
  value = {
    for type in local.record_types : "${lower(type)}_records" => length([
      for k, v in local.all_records : v
      if v.type == type
    ])
    if length([for k, v in local.all_records : v if v.type == type]) > 0
  }
}

output "records_for_certificates" {
  description = "DNS records that can have certificates (A, AAAA, CNAME)"
  value = {
    for k, v in local.all_records : k => v
    if contains(["A", "AAAA", "CNAME"], v.type)
  }
}