# Managed Rules Module

# Use preset values for ruleset IDs
# In a real environment, these would be discovered or provided by the user
locals {
  # Default IDs for managed rulesets
  owasp_ruleset_id              = "4814384a9e5d4991b9815dcfc25d2f1f"
  cloudflare_managed_ruleset_id = "efb7b8c7ab8c4d6fb56739341a7e824e"
  
  # Placeholders for ruleset info
  owasp_ruleset_info = {
    id = local.owasp_ruleset_id
    name = "OWASP ModSecurity Core Rule Set"
  }
  
  cloudflare_managed_ruleset_info = {
    id = local.cloudflare_managed_ruleset_id
    name = "Cloudflare Managed Ruleset"
  }
  
  # Root ruleset info (will be created by the module)
  managed_rules_root_ruleset_id = null
}

locals {
  # Generate the rules that would be added to the existing root ruleset
  owasp_rules_formatted = [
    for rule in var.owasp_rules : {
      enabled     = lookup(rule, "enabled", true)
      action      = "execute"
      expression  = lookup(rule, "expression", "true")
      description = lookup(rule, "description", "Deploy OWASP Core Ruleset")
      ref         = lookup(rule, "ref", null)
      action_parameters = {
        id = local.owasp_ruleset_id
        matched_data = {
          public_key = var.owasp_pub_key
        }
        overrides = lookup(rule, "has_overrides", false) ? {
          categories = lookup(rule, "category_overrides", []) != [] ? [
            for cat in lookup(rule, "category_overrides", []) : {
              category = cat.category
              enabled  = lookup(cat, "enabled", false)
              action   = lookup(cat, "action", null)
            }
          ] : null
        } : null
      }
    }
  ]

  cloudflare_rules_formatted = [
    for rule in var.cloudflare_rules : {
      enabled     = lookup(rule, "enabled", true)
      action      = "execute"
      expression  = lookup(rule, "expression", "true")
      description = lookup(rule, "description", "Deploy Cloudflare Managed Ruleset")
      ref         = lookup(rule, "ref", null)
      action_parameters = {
        id = local.cloudflare_managed_ruleset_id
        matched_data = {
          public_key = var.managed_pub_key
        }
        overrides = lookup(rule, "has_overrides", false) ? {
          categories = lookup(rule, "category_overrides", []) != [] ? [
            for cat in lookup(rule, "category_overrides", []) : {
              category = cat.category
              enabled  = lookup(cat, "enabled", false)
              action   = lookup(cat, "action", null)
            }
          ] : null
        } : null
      }
    }
  ]

  all_rule_definitions = concat(local.owasp_rules_formatted, local.cloudflare_rules_formatted)
}

# Root ruleset information is used by the deployments module
# See outputs.tf for the root_ruleset_info output