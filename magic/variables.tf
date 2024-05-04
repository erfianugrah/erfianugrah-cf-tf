variable "cloudflare_email" {
  description = "The email associated with the Cloudflare account"
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

variable "wan_ip_1" {
  description = "wan_ip_1"
  type        = string
  sensitive   = true
}

variable "wan_ip_2" {
  description = "wan_ip_2"
  type        = string
  sensitive   = true
}

variable "psk_sg" {
  description = "psk_sg"
  type        = string
  sensitive   = true
}

variable "psk_nl" {
  description = "psk_nl"
  type        = string
  sensitive   = true
}
variable "hex_id_sg" {
  description = "hex_id_sg"
  type        = string
  sensitive   = true
}
variable "fqdn_id_sg" {
  description = "fqdn_id_sg"
  type        = string
  sensitive   = true
}
variable "user_id_sg" {
  description = "user_id_sg"
  type        = string
  sensitive   = true
}

variable "hex_id_nl" {
  description = "hex_id_nl"
  type        = string
  sensitive   = true
}
variable "fqdn_id_nl" {
  description = "fqdn_id_nl"
  type        = string
  sensitive   = true
}
variable "user_id_nl" {
  description = "user_id_nl"
  type        = string
  sensitive   = true
}
