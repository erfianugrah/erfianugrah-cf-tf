# Rate Limiting Module

This module creates and manages rate limiting rules in Cloudflare at the account level.

## Usage

```hcl
module "rate_limiting" {
  source = "path/to/modules/rate_limiting"
  
  account_id = var.cloudflare_account_id
  rate_limit_rules = [
    {
      action          = "block"
      description     = "API Rate Limit"
      enabled         = true
      expression      = "http.request.uri.path contains \"/api/\""
      ratelimit = {
        characteristics     = ["ip.src"]
        period              = 60
        requests_per_period = 100
      }
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account_id | Cloudflare Account ID | string | n/a | yes |
| rate_limit_rules | List of rate limiting rules to apply | list(object) | See example | yes |
| ruleset_name | Name of the rate limiting ruleset | string | "Default_Account_Rate_Limiting_Ruleset" | no |
| ruleset_description | Description of the rate limiting ruleset | string | "Default_Account_Rate_Limiting_Ruleset" | no |
| deployment_expression | Expression to determine where the ruleset applies | string | "true" | no |

### Rate Limit Rule Object Structure

```hcl
{
  action          = string # "block", "js_challenge", "managed_challenge", etc.
  description     = string
  enabled         = optional(bool, true)
  expression      = string # Cloudflare filter expression
  ref             = optional(string)
  logging_enabled = optional(bool, false)
  ratelimit = object({
    characteristics            = list(string) # e.g. ["ip.src", "cf.colo.id"]
    mitigation_timeout         = optional(number, 60)
    period                     = number # seconds
    requests_per_period        = optional(number, 1000)
    requests_to_origin         = optional(bool, true)
    counting_expression        = optional(string)
    score_per_period           = optional(number)
    score_response_header_name = optional(string)
  })
}
```

## Outputs

| Name | Description |
|------|-------------|
| rate_limit_ruleset_id | ID of the created rate limiting ruleset |
| root_ruleset_info | Information about the root ruleset where this ruleset can be deployed |