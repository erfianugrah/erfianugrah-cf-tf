variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "ruleset_name" {
  description = "Name of the rate limiting ruleset"
  type        = string
  default     = "Default_Account_Rate_Limiting_Ruleset"
}

variable "ruleset_description" {
  description = "Description of the rate limiting ruleset"
  type        = string
  default     = "Default_Account_Rate_Limiting_Ruleset"
}

variable "rate_limit_rules" {
  description = "List of rate limiting rules to apply"
  type = list(object({
    action          = string
    description     = string
    enabled         = optional(bool, true)
    expression      = string
    ref             = optional(string)
    logging_enabled = optional(bool, false)
    ratelimit = object({
      characteristics            = list(string)
      mitigation_timeout         = optional(number, 60)
      period                     = number
      requests_per_period        = optional(number, 1000)
      requests_to_origin         = optional(bool, true)
      counting_expression        = optional(string)
      score_per_period           = optional(number)
      score_response_header_name = optional(string)
    })
  }))
  default = [
    {
      action      = "block"
      description = "Global Default Rate Limit"
      enabled     = false
      expression  = "http.host matches \".*\""
      ratelimit = {
        characteristics     = ["ip.src", "cf.colo.id"]
        mitigation_timeout  = 60
        period              = 60
        requests_per_period = 1000
        requests_to_origin  = true
      }
    }
  ]
}

variable "deployment_expression" {
  description = "Expression to determine where the ruleset applies"
  type        = string
  default     = "true"
}