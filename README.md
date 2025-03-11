This repository contains OpenTofu configurations for managing Cloudflare resources across multiple modules.

## Project Structure

- `account_details/` - Account-level configurations and API tokens
- `account_rulesets/` - Custom and root rulesets for the account
- `dev_platform/` - Pages, R2 buckets, and web analytics configurations
- `magic/` - Magic Transit configurations including tunnels and firewall rules
- `main_zone/` - Zone-level configurations including DNS, caching, security rules
- `zero_trust/` - Access applications, policies, and gateway configurations

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
```
