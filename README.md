# Cloudflare OpenTofu Infrastructure

This repository contains OpenTofu configurations for managing Cloudflare resources across multiple modules.

## Project Structure

- `account_details/` - Account-level configurations and API tokens
- `account_rulesets/` - Custom and root rulesets for the account
- `dev_platform/` - Pages, R2 buckets, and web analytics configurations
- `magic/` - Magic Transit configurations including tunnels and firewall rules
- `main_zone/` - Zone-level configurations including DNS, caching, security rules
  - `modules/dns_records/` - Module for creating and managing DNS records
  - `modules/certificate_packs/` - Module for creating certificates based on DNS records
- `zero_trust/` - Access applications, policies, and gateway configurations

## Key Features

- **Modular Design** - Resources are organized into logical modules for better maintainability
- **Reusable Components** - Common resource configurations are stored in modules
- **Secure Credentials** - Sensitive configuration encrypted with Mozilla SOPS and Age
- **Comprehensive Coverage** - Manages DNS, certificates, rulesets, and other Cloudflare resources

## Available Modules

### DNS Records (`main_zone/modules/dns_records`)
Creates and manages DNS records in a Cloudflare zone:
- Supports both simple and complex DNS record types
- Handles special record types requiring data blocks (SRV, MX, LOC, etc.)
- Provides organized outputs for certificate creation

### Certificate Packs (`main_zone/modules/certificate_packs`)
Creates TLS certificates for domains:
- Automatically creates certificates for DNS records
- Option for wildcard certificates
- Filters out DCV validation records
- Customizable certificate settings

### Account Rulesets (`account_rulesets/modules/*`)
Manages security rules at the account level:
- Custom WAF rules
- Rate limiting configurations
- Managed rule deployments

## Mozilla SOPS and Age Encryption
Install [Age](https://github.com/FiloSottile/age) and [Mozilla SOPS](https://github.com/getsops/sops)

### Generate Key
```sh
chmod +x /usr/local/bin/sops
age-keygen -o key.txt
```

### Use key to encrypt `.tf` and `.tfvars` files
Refer to my dotfiles [repo](https://github.com/erfianugrah/dotfiles/blob/windows/functions.zsh) for functions to automate this into a single call.

## Common Operations

```sh
# Initialize a module
cd <module_dir> && tofu init

# Plan changes
tofu plan -var-file=secrets.tfvars

# Apply changes
tofu apply -var-file=secrets.tfvars

# Format code
tofu fmt -recursive

# Validate configurations
tofu validate

# Target specific resources
tofu apply -var-file=secrets.tfvars -target=module.dns_records

# Import existing resources
tofu import -var-file=secrets.tfvars cloudflare_record.example abcdef123456
```

## Best Practices

- Keep sensitive values in `secrets.tfvars` (excluded from version control)
- Use variable defaults wisely and document all inputs
- Test changes with `tofu plan` before applying
