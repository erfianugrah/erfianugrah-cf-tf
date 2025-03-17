output "custom_ruleset_id" {
  description = "ID of the created custom ruleset"
  value       = cloudflare_ruleset.account_custom_ruleset.id
}

# Output removed because the resource is commented out
# output "custom_ruleset_deployment_id" {
#   description = "ID of the custom ruleset deployment"
#   value       = cloudflare_ruleset.account_custom_ruleset_deployment.id
# }
