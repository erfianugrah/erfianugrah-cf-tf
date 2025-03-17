variable "ruleset_id" {
  description = "The unique ID of the ruleset to retrieve"
  type        = string
  default     = null
}

variable "account_id" {
  description = "The Account ID to use for this endpoint. Mutually exclusive with the Zone ID."
  type        = string
  default     = null
}

variable "zone_id" {
  description = "The Zone ID to use for this endpoint. Mutually exclusive with the Account ID."
  type        = string
  default     = null
}

variable "retrieve_all" {
  description = "Whether to retrieve all rulesets instead of a single ruleset"
  type        = bool
  default     = false
}

variable "filter" {
  description = "Filter to apply when retrieving all rulesets"
  type = object({
    name  = optional(string)
    phase = optional(string)
    kind  = optional(string)
  })
  default = null
}