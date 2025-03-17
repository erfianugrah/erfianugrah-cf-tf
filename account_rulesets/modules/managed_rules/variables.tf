variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "ruleset_name" {
  description = "Name of the managed ruleset deployment"
  type        = string
  default     = "Default_Account_Managed_Ruleset_Deployment"
}

variable "ruleset_description" {
  description = "Description of the managed ruleset deployment"
  type        = string
  default     = "Default_Account_Managed_Ruleset_Deployment"
}

variable "owasp_pub_key" {
  description = "Public key for OWASP ruleset matched data"
  type        = string
  sensitive   = true
}

variable "managed_pub_key" {
  description = "Public key for Cloudflare managed ruleset matched data"
  type        = string
  sensitive   = true
}

variable "owasp_rules" {
  description = "List of OWASP ruleset configurations"
  type        = list(any)
  default = [
    {
      enabled       = true
      expression    = "true"
      description   = "Deploy OWASP Core Ruleset with default configuration"
      has_overrides = true
      category_overrides = [
        {
          category = "paranoia-level-3"
          enabled  = false
        },
        {
          category = "paranoia-level-4"
          enabled  = false
        }
      ]
    }
  ]
}

variable "cloudflare_rules" {
  description = "List of Cloudflare managed ruleset configurations"
  type        = list(any)
  default = [
    {
      enabled     = true
      expression  = "true"
      description = "Deploy Cloudflare Managed Ruleset with default configuration"
    }
  ]
}