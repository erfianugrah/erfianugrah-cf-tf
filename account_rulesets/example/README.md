# Cloudflare Account Rulesets Example

This directory contains example configurations for using the Cloudflare Account Rulesets module.

## Quick Start

1. Copy the example files to your project:
   ```
   cp provider.tf.example provider.tf
   cp secrets.tfvars.example secrets.tfvars
   ```

2. Edit `secrets.tfvars` with your Cloudflare credentials:
   ```
   cloudflare_api_token = "your-api-token-here"
   cloudflare_account_id = "your-account-id-here"
   cloudflare_owasp_pub_key = "your-owasp-public-key-here"
   cloudflare_managed_pub_key = "your-managed-ruleset-public-key-here"
   ```

3. Create a `main.tf` with your desired configuration:
   ```hcl
   module "cloudflare_rulesets" {
     source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"
     
     cloudflare_account_id   = var.cloudflare_account_id
     account_owasp_pub_key   = var.cloudflare_owasp_pub_key
     account_managed_pub_key = var.cloudflare_managed_pub_key
     
     # Optionally override the default rules
     custom_rules = [
       {
         action      = "block"
         expression  = "(not ssl)"
         description = "Block non-HTTPs"
       }
     ]
   }
   ```

4. Initialize Terraform/OpenTofu and apply the configuration:
   ```
   tofu init
   tofu plan -var-file=secrets.tfvars
   tofu apply -var-file=secrets.tfvars
   ```

5. Check for import instructions if needed:
   ```
   tofu output import_instructions
   ```

## Example Files

- `main.tf` - Shows multiple usage examples with different configurations
- `provider.tf.example` - Template for your provider configuration
- `secrets.tfvars.example` - Template for your Cloudflare credentials

## Minimal Setup

The module comes with sensible defaults, so you can use it with minimal configuration:

```hcl
module "cloudflare_rulesets" {
  source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"
  
  cloudflare_account_id   = var.cloudflare_account_id
  account_owasp_pub_key   = var.cloudflare_owasp_pub_key
  account_managed_pub_key = var.cloudflare_managed_pub_key
}
```

This will create rulesets with the default rules for each type.