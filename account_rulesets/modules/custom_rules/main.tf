# Custom Firewall Rules Module

resource "cloudflare_ruleset" "account_custom_ruleset" {
  account_id  = var.account_id
  name        = var.ruleset_name
  description = var.ruleset_description
  kind        = "custom"
  phase       = "http_request_firewall_custom"

  # Convert the custom_rules list to the format expected by Cloudflare
  rules = [
    for rule in var.custom_rules : {
      enabled     = lookup(rule, "enabled", true)
      action      = rule.action
      expression  = rule.expression
      description = rule.description
      ref         = lookup(rule, "ref", null)

      # Cloudflare only allows logging for skip actions
      # Remove logging option for non-skip actions
      logging = null

      # Add action_parameters if needed
      action_parameters = lookup(rule, "has_action_parameters", false) && lookup(rule, "response", null) != null ? {
        response = {
          content_type = rule.response.content_type
          content      = rule.response.content
          status_code  = rule.response.status_code
        }
      } : null
    }
  ]
}

# Use the data_source module to look up the existing root ruleset
module "root_ruleset_data" {
  source = "../data_source"

  account_id   = var.account_id
  retrieve_all = true
  filter = {
    phase = "http_request_firewall_custom"
    kind  = "root"
  }
}

locals {
  # Find the existing root ruleset
  custom_rules_root_ruleset = try([
    for ruleset in module.root_ruleset_data.all_rulesets.result : ruleset
    if ruleset.phase == "http_request_firewall_custom" && ruleset.kind == "root"
  ][0], null)

  custom_rules_root_ruleset_id = try(local.custom_rules_root_ruleset.id, null)

  # Generate the rule that would be added to the existing root ruleset
  custom_rule_for_root = {
    action      = "execute"
    expression  = var.deployment_expression
    description = "Deploy on All Zones the Default Custom Rules Ruleset"
    action_parameters = {
      id = cloudflare_ruleset.account_custom_ruleset.id
    }
  }
}

# Output information about the root ruleset
output "root_ruleset_info" {
  description = "Information about the existing root ruleset for http_request_firewall_custom phase"
  value = {
    id          = local.custom_rules_root_ruleset_id
    name        = try(local.custom_rules_root_ruleset.name, "Unknown")
    phase       = "http_request_firewall_custom"
    rule_to_add = local.custom_rule_for_root
  }
}

# Note: To add rules to the existing root ruleset, you would need to:
# 1. Import the existing ruleset into Terraform state
# 2. Add the rule to deploy your custom ruleset
#
# Example:
# terraform import module.custom_rules.cloudflare_ruleset.account_custom_ruleset_deployment [RULESET_ID]

# Commented out resource to avoid creation error
# resource "cloudflare_ruleset" "account_custom_ruleset_deployment" {
#   account_id  = var.account_id
#   name        = "${var.ruleset_name}_Deployment"
#   description = "${var.ruleset_description}_Deployment"
#   kind        = "root"
#   phase       = "http_request_firewall_custom"
#
#   rules = [
#     {
#       action      = "execute"
#       expression  = var.deployment_expression
#       description = "Deploy on All Zones the Default Custom Rules Ruleset"
#       action_parameters = {
#         id = cloudflare_ruleset.account_custom_ruleset.id
#       }
#     }
#   ]
# }