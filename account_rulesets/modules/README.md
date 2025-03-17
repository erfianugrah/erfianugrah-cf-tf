# Cloudflare Account Rulesets Modules

This directory contains individual modules for managing Cloudflare account-level rulesets.

## Available Modules

### 1. custom_rules
Manages custom firewall rules for Cloudflare at the account level.

```hcl
module "custom_firewall_rules" {
  source = "path/to/custom_rules"
  
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

### 2. rate_limiting
Sets up rate limiting rules for Cloudflare at the account level.

```hcl
module "rate_limiting" {
  source = "path/to/rate_limiting"
  
  account_id = var.cloudflare_account_id
  rate_limit_rules = [
    {
      action       = "block"
      description  = "API Rate Limit"
      expression   = "http.request.uri.path contains \"/api/\""
      ratelimit = {
        characteristics     = ["ip.src"]
        period              = 60
        requests_per_period = 100
      }
    }
  ]
}
```

### 3. managed_rules
Manages Cloudflare and OWASP managed rulesets at the account level.

```hcl
module "managed_rules" {
  source = "path/to/managed_rules"
  
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
}
```

### 4. deployments
Handles deployment of rulesets to root rulesets for all phases.

```hcl
module "deployments" {
  source = "path/to/deployments"
  
  account_id = var.cloudflare_account_id
  manage_root_rulesets = true
  
  # Pass outputs from other modules
  custom_rules_module  = module.custom_rules
  rate_limiting_module = module.rate_limiting
  managed_rules_module = module.managed_rules
}
```

### 5. data_source
Utility module for retrieving ruleset information.

```hcl
module "ruleset_data" {
  source = "path/to/data_source"
  
  account_id   = var.cloudflare_account_id
  retrieve_all = true
  filter = {
    phase = "http_request_firewall_managed"
  }
}
```

## Recommended Usage Pattern

```hcl
# 1. Create the rule modules
module "custom_rules" {
  source = "path/to/custom_rules"
  account_id = var.cloudflare_account_id
  custom_rules = [...]
}

module "rate_limiting" {
  source = "path/to/rate_limiting"
  account_id = var.cloudflare_account_id
  rate_limit_rules = [...]
}

module "managed_rules" {
  source = "path/to/managed_rules"
  account_id = var.cloudflare_account_id
  owasp_pub_key = var.owasp_pub_key
  managed_pub_key = var.managed_pub_key
  owasp_rules = [...]
  cloudflare_rules = [...]
}

# 2. Use the deployments module to manage root rulesets
module "deployments" {
  source = "path/to/deployments"
  
  account_id = var.cloudflare_account_id
  manage_root_rulesets = true
  
  custom_rules_module  = module.custom_rules
  rate_limiting_module = module.rate_limiting
  managed_rules_module = module.managed_rules
}

# 3. Output the import instructions for existing root rulesets
output "import_instructions" {
  value = module.deployments.import_instructions
}
```

## Important Notes

- Each module is designed to be used independently
- The deployments module handles root ruleset management
- Set `manage_root_rulesets = true` to manage deployments
- Import existing root rulesets using the instructions provided by the deployments module

## See Also

Check the `example/main.tf` file for more detailed examples.