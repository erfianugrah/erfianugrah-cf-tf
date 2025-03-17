# Rate Limiting Rules Module

resource "cloudflare_ruleset" "account_rl_ruleset" {
  account_id  = var.account_id
  name        = var.ruleset_name
  description = var.ruleset_description
  kind        = "custom"
  phase       = "http_ratelimit"

  rules = [
    for rule in var.rate_limit_rules : {
      action      = rule.action
      description = rule.description
      enabled     = lookup(rule, "enabled", true)
      expression  = rule.expression
      ref         = lookup(rule, "ref", null)

      ratelimit = {
        characteristics            = rule.ratelimit.characteristics
        mitigation_timeout         = lookup(rule.ratelimit, "mitigation_timeout", 60)
        period                     = rule.ratelimit.period
        requests_per_period        = lookup(rule.ratelimit, "requests_per_period", 1000)
        requests_to_origin         = lookup(rule.ratelimit, "requests_to_origin", true)
        counting_expression        = lookup(rule.ratelimit, "counting_expression", null)
        score_per_period           = lookup(rule.ratelimit, "score_per_period", null)
        score_response_header_name = lookup(rule.ratelimit, "score_response_header_name", null)
      }

      # Cloudflare only allows logging for skip actions
      # Remove logging option for non-skip actions
      logging = null
    }
  ]
}

# Use the data_source module to look up the existing root ruleset
module "root_ruleset_data" {
  source = "../data_source"

  account_id   = var.account_id
  retrieve_all = true
  filter = {
    phase = "http_ratelimit"
    kind  = "root"
  }
}

locals {
  # Find the existing root ruleset
  rate_limit_root_ruleset = try([
    for ruleset in module.root_ruleset_data.all_rulesets.result : ruleset
    if ruleset.phase == "http_ratelimit" && ruleset.kind == "root"
  ][0], null)

  rate_limit_root_ruleset_id = try(local.rate_limit_root_ruleset.id, null)

  # Generate the rule that would be added to the existing root ruleset
  rate_limit_rule_for_root = {
    action      = "execute"
    expression  = var.deployment_expression
    description = "Deploy on All Zones the Default Rate Limiting Ruleset"
    action_parameters = {
      id = cloudflare_ruleset.account_rl_ruleset.id
    }
  }
}

# Output information about the root ruleset
output "root_ruleset_info" {
  description = "Information about the existing root ruleset for http_ratelimit phase"
  value = {
    id          = local.rate_limit_root_ruleset_id
    name        = try(local.rate_limit_root_ruleset.name, "Unknown")
    phase       = "http_ratelimit"
    rule_to_add = local.rate_limit_rule_for_root
  }
}

# Note: To add rules to the existing root ruleset, you would need to:
# 1. Import the existing ruleset into Terraform state
# 2. Add the rule to deploy your rate limiting ruleset
#
# Example:
# terraform import module.rate_limiting.cloudflare_ruleset.account_rl_ruleset_deployment [RULESET_ID]

# Commented out resource to avoid creation error
# resource "cloudflare_ruleset" "account_rl_ruleset_deployment" {
#   account_id  = var.account_id
#   name        = "${var.ruleset_name}_Deployment"
#   description = "${var.ruleset_description}_Deployment"
#   kind        = "root"
#   phase       = "http_ratelimit"
#
#   rules = [
#     {
#       action      = "execute"
#       expression  = var.deployment_expression
#       description = "Deploy on All Zones the Default Rate Limiting Ruleset"
#       action_parameters = {
#         id = cloudflare_ruleset.account_rl_ruleset.id
#       }
#     }
#   ]
# }