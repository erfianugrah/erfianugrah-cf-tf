variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the zone"
  type        = string
}

variable "mode" {
  description = "Certificate generation mode: 'wildcard' (default: root + wildcard + auto multi-level wildcards), 'per_host' (Total TLS style: individual cert per record), or 'none' (skip cert creation, useful if another module handles it)"
  type        = string
  default     = "wildcard"

  validation {
    condition     = contains(["wildcard", "per_host", "none"], var.mode)
    error_message = "Mode must be one of: wildcard, per_host, none"
  }
}

variable "dns_records" {
  description = "Map of DNS records from the dns_records module output (records_for_certificates). Used in per_host mode and for multi-level subdomain detection in wildcard mode."
  type        = map(any)
  default     = {}
}

variable "additional_wildcards" {
  description = "Additional wildcard subdomain parents to explicitly create certs for, e.g. ['vyos', 'saas']. In wildcard mode, multi-level subdomains are auto-detected from dns_records, but you can add extras here."
  type        = list(string)
  default     = []
}

variable "exclude_from_per_host" {
  description = "Record keys to exclude from per-host cert generation (e.g. NS delegations, TXT records that already have wildcard coverage)"
  type        = set(string)
  default     = []
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
  description = "DNS record types eligible for certificate creation"
  type        = list(string)
  default     = ["A", "AAAA", "CNAME"]
}
