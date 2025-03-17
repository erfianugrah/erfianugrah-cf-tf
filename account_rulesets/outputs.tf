# Simplified outputs file
output "ruleset_ids" {
  description = "IDs of the created rulesets"
  value = {
    custom_ruleset = module.custom_rules.custom_ruleset_id
    rate_limit     = module.rate_limiting.rate_limit_ruleset_id
    owasp          = module.managed_rules.owasp_ruleset_id
    cloudflare     = module.managed_rules.cloudflare_managed_ruleset_id
  }
}

# Import instructions
output "import_instructions" {
  description = "Instructions for importing existing root rulesets"
  value       = module.deployments.import_instructions
}

