variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "secret" {
  description = "Base64-encoded tunnel secret"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Tunnel name"
  type        = string
}

variable "warp_routing" {
  description = "Enable WARP routing for this tunnel"
  type        = bool
  default     = true
}

variable "ingress_rules" {
  description = "Ordered list of ingress rules. Last rule must be the catch-all (hostname = null)."
  type = list(object({
    hostname = optional(string)
    path     = optional(string)
    service  = string
    origin_request = optional(object({
      no_tls_verify      = optional(bool)
      http2_origin       = optional(bool)
      origin_server_name = optional(string)
      http_host_header   = optional(string)
      access = optional(object({
        required  = bool
        team_name = string
        aud_tag   = list(string)
      }))
    }))
  }))

  validation {
    condition     = length(var.ingress_rules) > 0 && var.ingress_rules[length(var.ingress_rules) - 1].hostname == null
    error_message = "Last ingress rule must be the catch-all (hostname = null)."
  }
}

variable "route" {
  description = "Optional private network route for this tunnel"
  type = object({
    network = string
    comment = optional(string)
  })
  default = null
}

variable "vnet_name" {
  description = "Optional virtual network name. If set, creates a vnet and attaches the route to it."
  type        = string
  default     = null
}
