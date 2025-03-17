# EXAMPLE USAGE ONLY - Not Active In Current Project
#
# This file demonstrates how to use the account_rulesets module
# in your own Terraform/OpenTofu configuration.

# In your project, create a main.tf file with module references like this:

# Example 1: Minimal configuration using defaults
module "cloudflare_account_rulesets" {
  source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"

  # Required variables
  cloudflare_account_id   = var.cloudflare_account_id
  account_owasp_pub_key   = var.cloudflare_owasp_pub_key
  account_managed_pub_key = var.cloudflare_managed_pub_key

  # Whether to manage root rulesets (defaults to true)
  manage_root_rulesets = true

  # All defaults will be used for rules
}

# Example 2: Custom configuration overriding defaults
module "cloudflare_custom_rulesets" {
  source = "git::https://github.com/yourorg/erfianugrah-cf-tf//account_rulesets"

  # Required variables
  cloudflare_account_id   = var.cloudflare_account_id
  account_owasp_pub_key   = var.cloudflare_owasp_pub_key
  account_managed_pub_key = var.cloudflare_managed_pub_key

  # Override default custom rules
  custom_rules = [
    {
      action      = "block"
      expression  = "http.request.uri.path contains \"wp-login.php\""
      description = "Block WordPress login attempts"
    },
    {
      action      = "js_challenge"
      expression  = "cf.threat_score > 20"
      description = "Challenge suspicious visitors"
    }
  ]

  # Override default rate limiting rules
  rate_limit_rules = [
    {
      action      = "block"
      description = "Protect login endpoint"
      expression  = "http.request.uri.path contains \"/login\""
      ratelimit = {
        characteristics     = ["ip.src"]
        period              = 60
        requests_per_period = 10
      }
    }
  ]
}

# Example provider.tf:
# provider "cloudflare" {
#   api_token = var.cloudflare_api_token
# }
# 
# variable "cloudflare_api_token" {
#   description = "Cloudflare API token"
#   type        = string
#   sensitive   = true
# }
# 
# variable "cloudflare_account_id" {
#   description = "Cloudflare account ID"
#   type        = string
# }
# 
# variable "cloudflare_owasp_pub_key" {
#   description = "Cloudflare OWASP managed ruleset public key"
#   type        = string
#   sensitive   = true
# }
# 
# variable "cloudflare_managed_pub_key" {
#   description = "Cloudflare managed ruleset public key"
#   type        = string
#   sensitive   = true
# }