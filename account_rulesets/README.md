# Cloudflare Account Rulesets

A collection of Terraform/OpenTofu modules for managing Cloudflare account-level rulesets.

## Quick Start

1. Copy files from the example directory:
   ```
   cp example/provider.tf.example provider.tf
   cp example/secrets.tfvars.example secrets.tfvars
   ```

2. Create a minimal main.tf:
   ```hcl
   module "cloudflare_rulesets" {
     source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"
     
     cloudflare_account_id   = var.cloudflare_account_id
     account_owasp_pub_key   = var.cloudflare_owasp_pub_key
     account_managed_pub_key = var.cloudflare_managed_pub_key
   }
   ```

3. Initialize and apply:
   ```
   tofu init
   tofu plan -var-file=secrets.tfvars
   tofu apply -var-file=secrets.tfvars
   ```

## Features

- **Simple Interface**: Minimal configuration with sensible defaults
- **Comprehensive Protection**: Manages custom rules, rate limiting, and managed rules
- **Safe Deployments**: Handles Cloudflare's one-root-ruleset-per-phase limitation
- **Import Support**: Provides instructions for importing existing rulesets

## Directory Structure

```
account_rulesets/
├── example/          # Ready-to-use examples
├── modules/          # Component modules
│   ├── custom_rules/     # Custom firewall rules
│   ├── data_source/      # Ruleset data retrieval
│   ├── deployments/      # Root ruleset deployment management
│   ├── managed_rules/    # Cloudflare managed rules
│   └── rate_limiting/    # Rate limiting rules
└── main.tf           # Main entry point for users
```

## Usage

### Only Three Files Needed

1. **main.tf** - Your configuration
2. **provider.tf** - Cloudflare provider setup
3. **secrets.tfvars** - Sensitive credentials

### Example main.tf

```hcl
module "cloudflare_rulesets" {
  source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"
  
  # Required variables - stored in secrets.tfvars
  cloudflare_account_id   = var.cloudflare_account_id
  account_owasp_pub_key   = var.cloudflare_owasp_pub_key
  account_managed_pub_key = var.cloudflare_managed_pub_key
  
  # Optional: Override the default custom rules
  custom_rules = [
    {
      action      = "block"
      expression  = "(not ssl)"
      description = "Block non-HTTPs"
    },
    {
      action      = "block"
      expression  = "http.request.uri.path contains \"/wp-login.php\""
      description = "Block WordPress login attempts"
    }
  ]
  
  # Optional: Override the default rate limiting rules
  rate_limit_rules = [
    {
      action      = "block"
      description = "Protect API endpoint"
      expression  = "http.request.uri.path contains \"/api/\""
      ratelimit = {
        characteristics     = ["ip.src"]
        period              = 60
        requests_per_period = 100
      }
    }
  ]
}
```

## Understanding Cloudflare Account Rulesets

This module manages three types of rulesets:

1. **Custom Rules**: Block or challenge requests based on custom expressions
2. **Rate Limiting**: Protect endpoints from abuse with rate limits
3. **Managed Rules**: Deploy Cloudflare and OWASP security rulesets

It also handles the deployment of these rulesets to "root rulesets" which apply them across your account.

See the [example directory](example/) for complete usage examples.