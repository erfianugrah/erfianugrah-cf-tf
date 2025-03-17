# Output information about the deployments
output "deployment_info" {
  description = "Information about root ruleset deployments"
  value = {
    custom_rules_root = {
      id        = try(cloudflare_ruleset.custom_ruleset_deployment[0].id, local.existing_custom_rules_root_id)
      exists    = local.custom_rules_root_exists
      import_id = local.existing_custom_rules_root_id
    }
    rate_limit_root = {
      id        = try(cloudflare_ruleset.ratelimit_ruleset_deployment[0].id, local.existing_rate_limit_root_id)
      exists    = local.rate_limit_root_exists
      import_id = local.existing_rate_limit_root_id
    }
    managed_rules_root = {
      id        = try(cloudflare_ruleset.managed_ruleset_deployment[0].id, local.existing_managed_rules_root_id)
      exists    = local.managed_rules_root_exists
      import_id = local.existing_managed_rules_root_id
    }
  }
}

# Output import instructions
output "import_instructions" {
  description = "Instructions for importing existing root rulesets"
  value       = <<-EOT
  ---------------------------------------------------------------
  IMPORTANT: HOW TO MANAGE ROOT RULESETS WITH THIS MODULE
  ---------------------------------------------------------------
  
  Cloudflare only allows one root ruleset per phase. To manage them:
  
  1. Check if root rulesets exist for each phase:
     ${local.custom_rules_root_exists ? "✓" : "✗"} Custom rules root ruleset (http_request_firewall_custom)
     ${local.rate_limit_root_exists ? "✓" : "✗"} Rate limiting root ruleset (http_ratelimit)
     ${local.managed_rules_root_exists ? "✓" : "✗"} Managed rules root ruleset (http_request_firewall_managed)
  
  2. If root rulesets exist, import them into your state:
  
     ${local.custom_rules_root_exists ? "tofu import 'module.deployments.cloudflare_ruleset.custom_ruleset_deployment[0]' ${local.existing_custom_rules_root_id}" : "Custom rules root ruleset will be created"}
     ${local.rate_limit_root_exists ? "tofu import 'module.deployments.cloudflare_ruleset.ratelimit_ruleset_deployment[0]' ${local.existing_rate_limit_root_id}" : "Rate limiting root ruleset will be created"}
     ${local.managed_rules_root_exists ? "tofu import 'module.deployments.cloudflare_ruleset.managed_ruleset_deployment[0]' ${local.existing_managed_rules_root_id}" : "Managed rules root ruleset will be created"}
  
  3. Set var.manage_root_rulesets = true in your configuration
  
  4. Run 'tofu plan' to verify the changes
  
  5. Apply the changes with 'tofu apply'
  
  SAFETY FEATURES:
  - Root rulesets are protected with prevent_destroy = true
  - Resources are only created if explicitly enabled with var.manage_root_rulesets
  - Existing rules in root rulesets are preserved
  
  For clean-up:
  - Never 'tofu destroy' root rulesets - they're account-level resources
  - Set var.manage_root_rulesets = false to stop managing them
  - Use the Cloudflare dashboard to manually modify rules if needed
  ---------------------------------------------------------------
  EOT
}