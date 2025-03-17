variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "manage_root_rulesets" {
  description = "Whether to manage root rulesets (creates them if they don't exist)"
  type        = bool
  default     = true
}

variable "custom_rules_module" {
  description = "Output from the custom_rules module"
  type = object({
    custom_ruleset_id = string
  })
}

variable "rate_limiting_module" {
  description = "Output from the rate_limiting module"
  type = object({
    rate_limit_ruleset_id = string
  })
}

variable "managed_rules_module" {
  description = "Output from the managed_rules module"
  type = object({
    root_ruleset_info = object({
      rules_to_add = list(any)
    })
  })
}