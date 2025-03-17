output "rate_limit_ruleset_id" {
  description = "ID of the created rate limiting ruleset"
  value       = cloudflare_ruleset.account_rl_ruleset.id
}

# Output removed because the resource is commented out
# output "rate_limit_ruleset_deployment_id" {
#   description = "ID of the rate limiting ruleset deployment"
#   value       = cloudflare_ruleset.account_rl_ruleset_deployment.id
# }
