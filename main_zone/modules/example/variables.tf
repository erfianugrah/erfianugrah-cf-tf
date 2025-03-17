variable "cloudflare_zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the zone"
  type        = string
}

variable "sg_ip" {
  description = "Singapore IP address"
  type        = string
}