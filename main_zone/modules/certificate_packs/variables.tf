variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the zone"
  type        = string
}

variable "create_wildcard_cert" {
  description = "Whether to create a wildcard certificate for the domain"
  type        = bool
  default     = true
}

variable "dns_records" {
  description = "Map of DNS records from the dns_records module output (records_for_certificates)"
  type        = map(any)
  default     = {}
}

variable "certificate_authority" {
  description = "The certificate authority to use"
  type        = string
  default     = "lets_encrypt"
}

variable "validation_method" {
  description = "The validation method to use"
  type        = string
  default     = "txt"
}

variable "validity_days" {
  description = "The validity period of the certificate in days"
  type        = number
  default     = 90
}

variable "wait_for_active_status" {
  description = "Whether to wait for a certificate pack to reach status 'active' during creation"
  type        = bool
  default     = false
}

variable "cert_types" {
  description = "List of record types to create certificates for"
  type        = list(string)
  default     = ["A", "AAAA", "CNAME"]
}