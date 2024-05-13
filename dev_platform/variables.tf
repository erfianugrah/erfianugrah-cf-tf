variable "cloudflare_email" {
  description = "The email associated with the Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_user_id" {
  description = "Cloudflare Account User ID"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_key" {
  description = "The API key for accessing Cloudflare"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "The zone ID for the Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "The zone ID for the Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "sg_ip" {
  description = "sg static ip"
  type        = string
  sensitive   = true
}

variable "nl_ip" {
  description = "nl static ip"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "The domain name to be used"
  type        = string
  sensitive   = true
}
