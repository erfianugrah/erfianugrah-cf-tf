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

variable "cloudflare_outlook_email" {
  description = "Outlook alias"
  type        = string
  sensitive   = true
}

variable "cloudflare_workspace_email" {
  description = "Google Workspace alias"
  type        = string
  sensitive   = true
}

variable "cloudflare_work_email" {
  description = "Work alias"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "The domain name to be used"
  type        = string
  sensitive   = true
}

variable "r2_access_key_id" {
  description = "r2 access key id"
  type = string
}

variable "r2_access_key" {
  description = "r2 access key"
  type = string
}
