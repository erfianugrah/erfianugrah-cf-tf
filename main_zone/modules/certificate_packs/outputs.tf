output "certificates" {
  description = "Map of all created certificate packs"
  value       = cloudflare_certificate_pack.certs
}

output "certificate_count" {
  description = "Total number of certificates created"
  value       = length(cloudflare_certificate_pack.certs)
}

output "certificate_hosts" {
  description = "Map of all hosts covered by certificates"
  value = {
    for k, v in cloudflare_certificate_pack.certs : k => v.hosts
  }
}

output "wildcard_certificate" {
  description = "The wildcard certificate if created"
  value       = var.create_wildcard_cert ? cloudflare_certificate_pack.certs["main_domain"] : null
}