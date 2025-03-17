# Managed Rules Module

This module configures and deploys Cloudflare managed rulesets (OWASP Core and Cloudflare Managed) at the account level.

## Usage

```hcl
module "managed_rules" {
  source = "path/to/modules/managed_rules"
  
  account_id      = var.cloudflare_account_id
  owasp_pub_key   = var.owasp_pub_key
  managed_pub_key = var.managed_pub_key
  
  owasp_rules = [
    {
      enabled       = true
      expression    = "true"
      description   = "OWASP Core Ruleset"
      has_overrides = true
      category_overrides = [
        {
          category = "paranoia-level-3"
          enabled  = false
        }
      ]
    }
  ]
  
  cloudflare_rules = [
    {
      enabled     = true
      expression  = "true"
      description = "Cloudflare Managed Ruleset"
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account_id | Cloudflare Account ID | string | n/a | yes |
| owasp_pub_key | Public key for OWASP ruleset matched data | string | n/a | yes |
| managed_pub_key | Public key for Cloudflare managed ruleset matched data | string | n/a | yes |
| owasp_rules | List of OWASP ruleset configurations | list(object) | See example | no |
| cloudflare_rules | List of Cloudflare managed ruleset configurations | list(object) | See example | no |
| ruleset_name | Name of the managed ruleset deployment | string | "Default_Account_Managed_Ruleset_Deployment" | no |
| ruleset_description | Description of the managed ruleset deployment | string | "Default_Account_Managed_Ruleset_Deployment" | no |
| fallback_owasp_ruleset_id | Fallback OWASP ruleset ID if dynamic discovery fails | string | null | no |
| fallback_cloudflare_ruleset_id | Fallback Cloudflare managed ruleset ID if dynamic discovery fails | string | null | no |

### OWASP Rule Object Structure

```hcl
{
  enabled                    = bool
  expression                 = string # Cloudflare filter expression
  description                = string
  ref                        = optional(string)
  logging_enabled            = optional(bool, false)
  has_overrides              = bool
  override_action            = optional(string)
  override_enabled           = optional(bool)
  override_sensitivity_level = optional(string)
  category_overrides = list(object({
    category          = string
    enabled           = bool
    action            = optional(string)
    sensitivity_level = optional(string)
  }))
  rule_overrides = optional(list(object({
    id                = string
    enabled           = optional(bool)
    action            = optional(string)
    sensitivity_level = optional(string)
    score_threshold   = optional(number)
  })), [])
}
```

### Cloudflare Rule Object Structure

```hcl
{
  enabled                    = bool
  expression                 = string # Cloudflare filter expression
  description                = string
  ref                        = optional(string)
  logging_enabled            = optional(bool, false)
  has_overrides              = optional(bool, false)
  # Other override fields similar to OWASP rules
}
```

## Outputs

| Name | Description |
|------|-------------|
| owasp_ruleset_id | ID of the OWASP Core Ruleset (dynamically discovered) |
| cloudflare_managed_ruleset_id | ID of the Cloudflare Managed Ruleset (dynamically discovered) |
| root_ruleset_info | Information about the root ruleset for managed rules |
| owasp_ruleset_discovery_succeeded | Whether the OWASP ruleset was successfully discovered |
| cloudflare_managed_ruleset_discovery_succeeded | Whether the Cloudflare managed ruleset was successfully discovered |