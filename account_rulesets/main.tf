# Cloudflare Account Rulesets Module

# Resource modules for creating and managing rulesets
module "custom_rules" {
  source = "./modules/custom_rules"

  account_id   = var.cloudflare_account_id
  custom_rules = var.custom_rules
}

module "rate_limiting" {
  source = "./modules/rate_limiting"

  account_id       = var.cloudflare_account_id
  rate_limit_rules = var.rate_limit_rules
}

module "managed_rules" {
  source = "./modules/managed_rules"

  account_id       = var.cloudflare_account_id
  owasp_pub_key    = var.account_owasp_pub_key
  managed_pub_key  = var.account_managed_pub_key
  owasp_rules      = var.owasp_rules
  cloudflare_rules = var.cloudflare_rules
}

# Deployments module for managing root rulesets
module "deployments" {
  source = "./modules/deployments"

  account_id           = var.cloudflare_account_id
  manage_root_rulesets = var.manage_root_rulesets

  # Pass outputs from other modules
  custom_rules_module  = module.custom_rules
  rate_limiting_module = module.rate_limiting
  managed_rules_module = module.managed_rules
}