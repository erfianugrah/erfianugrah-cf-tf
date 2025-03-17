# Output the ruleset IDs
output "owasp_ruleset_id" {
  description = "ID of the OWASP Core Ruleset"
  value       = local.owasp_ruleset_id
}

output "cloudflare_managed_ruleset_id" {
  description = "ID of the Cloudflare Managed Ruleset"
  value       = local.cloudflare_managed_ruleset_id
}

# Output the ruleset names
output "owasp_ruleset_name" {
  description = "Name of the OWASP Core Ruleset"
  value       = try(local.owasp_ruleset_info.name, "Not found - using fallback ID")
}

output "cloudflare_managed_ruleset_name" {
  description = "Name of the Cloudflare Managed Ruleset"
  value       = try(local.cloudflare_managed_ruleset_info.name, "Not found - using fallback ID")
}

# Output discovery status
output "owasp_ruleset_discovery_succeeded" {
  description = "Whether the OWASP ruleset was successfully discovered"
  value       = local.owasp_ruleset_info != null
}

output "cloudflare_managed_ruleset_discovery_succeeded" {
  description = "Whether the Cloudflare managed ruleset was successfully discovered"
  value       = local.cloudflare_managed_ruleset_info != null
}

# Root ruleset info for deployment
output "root_ruleset_info" {
  description = "Information about the rules to add to the managed root ruleset"
  value = {
    rules_to_add = local.all_rule_definitions
  }
}
