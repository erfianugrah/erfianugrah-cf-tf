# Data Source Module

This is a utility module for retrieving Cloudflare ruleset information. It provides flexible options for querying specific rulesets or all rulesets with filtering capabilities.

## Usage

```hcl
# Retrieve a specific ruleset by ID
module "ruleset_info" {
  source = "path/to/modules/data_source"
  
  account_id = var.cloudflare_account_id
  ruleset_id = "b18bd3f52e7c477db66c17e7897bfdb7" # ID of the ruleset to retrieve
}

# Retrieve all rulesets with filtering
module "filtered_rulesets" {
  source = "path/to/modules/data_source"
  
  account_id   = var.cloudflare_account_id
  retrieve_all = true
  filter = {
    phase = "http_request_firewall_managed"
    kind  = "managed"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ruleset_id | The unique ID of the ruleset to retrieve | string | null | no |
| account_id | The Account ID to use for this endpoint (mutually exclusive with zone_id) | string | null | no |
| zone_id | The Zone ID to use for this endpoint (mutually exclusive with account_id) | string | null | no |
| retrieve_all | Whether to retrieve all rulesets instead of a single ruleset | bool | false | no |
| filter | Filter to apply when retrieving all rulesets | object | null | no |

### Filter Object Structure

```hcl
{
  name  = optional(string) # Regex pattern for matching ruleset name
  phase = optional(string) # Exact phase name (e.g., "http_request_firewall_managed")
  kind  = optional(string) # Exact kind (e.g., "managed", "custom", "root")
}
```

## Outputs

| Name | Description |
|------|-------------|
| ruleset | The retrieved ruleset information |
| all_rulesets | All retrieved rulesets |
| filtered_rulesets | The filtered rulesets based on provided filter criteria |
| ruleset_id | The ID of the retrieved ruleset |
| ruleset_name | The name of the retrieved ruleset |
| ruleset_description | The description of the retrieved ruleset |
| ruleset_kind | The kind of the retrieved ruleset |
| ruleset_phase | The phase of the retrieved ruleset |
| ruleset_rules | The rules in the retrieved ruleset |
| owasp_ruleset | The OWASP ruleset if it exists in the retrieved rulesets |
| cloudflare_managed_ruleset | The Cloudflare Managed ruleset if it exists in the retrieved rulesets |