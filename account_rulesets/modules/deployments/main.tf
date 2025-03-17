# Deployments Module
# Handles deployment of rulesets to root rulesets for all phases

# We can't dynamically discover rulesets in this version of the provider
# Instead, we'll use static values and ask users to import existing rulesets

# Store information about root rulesets
locals {
  # Default to non-existent root rulesets
  custom_rules_root_exists  = false
  rate_limit_root_exists    = false
  managed_rules_root_exists = false

  # Default to null IDs - users will import resources if needed
  existing_custom_rules_root_id  = null
  existing_rate_limit_root_id    = null
  existing_managed_rules_root_id = null

  # Define rules for custom ruleset deployment
  custom_rules_deployment_rules = [
    {
      action      = "execute"
      expression  = "true"
      description = "Deploy on All Zones the Default Custom Rules Ruleset"
      action_parameters = {
        id = var.custom_rules_module.custom_ruleset_id
      }
    }
  ]

  # Define rules for rate limiting ruleset deployment
  rate_limit_deployment_rules = [
    {
      action      = "execute"
      expression  = "true"
      description = "Deploy on All Zones the Default Rate Limiting Ruleset"
      action_parameters = {
        id = var.rate_limiting_module.rate_limit_ruleset_id
      }
    }
  ]
}

# Custom rules deployment
resource "cloudflare_ruleset" "custom_ruleset_deployment" {
  count = var.manage_root_rulesets ? 1 : 0

  account_id  = var.account_id
  name        = "Default Account Custom Rules Deployment"
  description = "Deploy custom rules to all zones"
  kind        = "root"
  phase       = "http_request_firewall_custom"
  rules       = local.custom_rules_deployment_rules

  # Prevent accidental destruction
  lifecycle {
    prevent_destroy = true

    # Use existing name and description
    ignore_changes = [
      name,
      description
    ]
  }
}

# Rate limiting deployment
resource "cloudflare_ruleset" "ratelimit_ruleset_deployment" {
  count = var.manage_root_rulesets ? 1 : 0

  account_id  = var.account_id
  name        = "Default Account Rate Limiting Deployment"
  description = "Deploy rate limiting rules to all zones"
  kind        = "root"
  phase       = "http_ratelimit"
  rules       = local.rate_limit_deployment_rules

  # Prevent accidental destruction
  lifecycle {
    prevent_destroy = true

    # Use existing name and description
    ignore_changes = [
      name,
      description
    ]
  }
}

# Managed rules deployment
resource "cloudflare_ruleset" "managed_ruleset_deployment" {
  count = var.manage_root_rulesets ? 1 : 0

  account_id  = var.account_id
  name        = "Default Account Managed Ruleset Deployment"
  description = "Deploy managed rules to all zones"
  kind        = "root"
  phase       = "http_request_firewall_managed"
  rules       = var.managed_rules_module.root_ruleset_info.rules_to_add

  # Prevent accidental destruction
  lifecycle {
    prevent_destroy = true

    # Use existing name and description
    ignore_changes = [
      name,
      description
    ]
  }
}