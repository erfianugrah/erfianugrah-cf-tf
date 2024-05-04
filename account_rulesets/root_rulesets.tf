resource "cloudflare_ruleset" "account_custom_ruleset_deployment" {
  account_id  = var.cloudflare_account_id
  name        = "Default_Account_Custom_Rules_Deployment"
  description = "Default_Account_Custom_Rules_Deployment"
  kind        = "root"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "execute"
    expression  = "true"
    description = "Deploy on All Zones the Default Custom Rules Ruleset"
    action_parameters {
      id = cloudflare_ruleset.account_custom_ruleset.id
    }
  }
}

resource "cloudflare_ruleset" "account_rl_ruleset_deployment" {
  account_id  = var.cloudflare_account_id
  name        = "Default_Account_Rate_Limiting_Ruleset_Deployment"
  description = "Default_Account_Rate_Limiting_Ruleset_Deployment"
  kind        = "root"
  phase       = "http_ratelimit"

  rules {
    action      = "execute"
    expression  = "true"
    description = "Deploy on All Zones the Default Rate Limiting Ruleset"
    action_parameters {
      id = cloudflare_ruleset.account_rl_ruleset.id
    }
  }
}

resource "cloudflare_ruleset" "account_managed_ruleset_deployment" {
  account_id  = var.cloudflare_account_id
  name        = "Default_Account_Managed_Ruleset_Deployment"
  description = "Default_Account_Managed_Ruleset_Deployment"
  kind        = "root"
  phase       = "http_request_firewall_managed"

  rules {
    enabled     = false
    action      = "execute"
    expression  = "true"
    description = "Deploy on All Zones the Default OWASP Managed Ruleset"
    action_parameters {
      id = data.cloudflare_rulesets.account_managed_owasp_ruleset.rulesets[0].id
      matched_data {
        public_key = var.account_owasp_pub_key
      }
      overrides {
        categories {
          category = "paranoia-level-3"
          enabled  = false
        }
        categories {
          category = "paranoia-level-4"
          enabled  = false
        }
      }
    }
  }
  rules {
    enabled     = false
    action      = "execute"
    expression  = "true"
    description = "Deploy on All Zones the Default Cloudflare Managed Ruleset"
    action_parameters {
      id = data.cloudflare_rulesets.account_managed_cloudflare_ruleset.rulesets[0].id
      matched_data {
        public_key = var.account_managed_pub_key
      }
    }
  }
}
