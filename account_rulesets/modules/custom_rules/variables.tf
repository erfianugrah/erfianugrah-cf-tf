variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "ruleset_name" {
  description = "Name of the custom ruleset"
  type        = string
  default     = "Default_Account_Custom_Ruleset"
}

variable "ruleset_description" {
  description = "Description of the custom ruleset"
  type        = string
  default     = "Default_Account_Custom_Ruleset"
}

variable "custom_rules" {
  description = "List of custom rules to apply"
  type        = list(any)
  default = [
    {
      enabled     = true
      action      = "block"
      expression  = "(not ssl)"
      description = "Block non-HTTPs"
    },
    {
      enabled     = true
      action      = "block"
      expression  = "http.request.uri.path contains \"wp-login.php\""
      description = "Block WordPress login attempts"
    }
  ]
}

variable "deployment_expression" {
  description = "Expression to determine where the ruleset applies"
  type        = string
  default     = "true"
}
