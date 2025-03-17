# Custom Rules Module

This module creates and manages custom firewall rules in Cloudflare at the account level.

## Usage

```hcl
module "custom_rules" {
  source = "path/to/modules/custom_rules"
  
  account_id = var.cloudflare_account_id
  custom_rules = [
    {
      enabled     = true
      action      = "block"
      expression  = "(not ssl)"
      description = "Block non-HTTPs"
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account_id | Cloudflare Account ID | string | n/a | yes |
| custom_rules | List of custom rules to apply | list(object) | See example | yes |
| ruleset_name | Name of the custom ruleset | string | "Default_Account_Custom_Ruleset" | no |
| ruleset_description | Description of the custom ruleset | string | "Default_Account_Custom_Ruleset" | no |
| deployment_expression | Expression to determine where the ruleset applies | string | "true" | no |

### Custom Rule Object Structure

```hcl
{
  enabled               = optional(bool, true)
  action                = string # "block", "js_challenge", "managed_challenge", "skip", etc.
  expression            = string # Cloudflare filter expression
  description           = string
  ref                   = optional(string)
  logging_enabled       = optional(bool, false)
  has_action_parameters = optional(bool, false)
  response = optional(object({
    content_type = string
    content      = string
    status_code  = number
  }))
}
```

## Outputs

| Name | Description |
|------|-------------|
| custom_ruleset_id | ID of the created custom ruleset |
| root_ruleset_info | Information about the root ruleset where this ruleset can be deployed |