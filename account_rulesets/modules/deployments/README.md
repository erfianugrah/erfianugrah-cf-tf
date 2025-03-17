# Cloudflare Account Ruleset Deployments Module

This module manages the deployment of rulesets to root rulesets in Cloudflare. It handles the detection of existing root rulesets and provides guidance for importing them into Terraform state.

## Important Note

Cloudflare allows only one root ruleset per phase. This module handles that limitation by:

1. Detecting existing root rulesets
2. Providing import commands when existing root rulesets are found
3. Creating root rulesets when they don't exist (if `manage_root_rulesets = true`)
4. Protecting root rulesets from accidental destruction

## Usage

```hcl
module "deployments" {
  source = "path/to/modules/deployments"

  account_id            = var.cloudflare_account_id
  manage_root_rulesets  = true
  
  # Pass the outputs from the other modules
  custom_rules_module   = module.custom_rules
  rate_limiting_module  = module.rate_limiting
  managed_rules_module  = module.managed_rules
}

# Access the import instructions
output "import_instructions" {
  value = module.deployments.import_instructions
}
```

## Requirements

This module requires outputs from the following modules:
- custom_rules
- rate_limiting
- managed_rules

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account_id | Cloudflare Account ID | `string` | n/a | yes |
| manage_root_rulesets | Whether to manage root rulesets | `bool` | `true` | no |
| custom_rules_module | Output from the custom_rules module | `object` | n/a | yes |
| rate_limiting_module | Output from the rate_limiting module | `object` | n/a | yes |
| managed_rules_module | Output from the managed_rules module | `object` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| deployment_info | Information about root ruleset deployments |
| import_instructions | Instructions for importing existing root rulesets |

## Importing Existing Root Rulesets

If you have existing root rulesets, you'll need to import them into your Terraform state to avoid conflicts.
Run `terraform apply` first to see the import instructions, then run the import commands provided.