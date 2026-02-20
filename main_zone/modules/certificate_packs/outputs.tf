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

output "multi_level_parents" {
  description = "Auto-detected multi-level subdomain parents that got wildcard certs"
  value       = var.mode == "wildcard" ? local.multi_level_parents : []
}
