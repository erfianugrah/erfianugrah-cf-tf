variable "zone_id" {
  description = "The Cloudflare Zone ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the zone"
  type        = string
}

# For simple record types (using content field)
variable "records" {
  description = "Map of simple DNS records to create (using content field)"
  type = map(object({
    name            = string
    type            = string # A, AAAA, CAA, CNAME, TXT, etc.
    content         = string
    proxied         = optional(bool)
    ttl             = optional(number)
    comment         = optional(string)
    tags            = optional(set(string))
    priority        = optional(number)
    allow_overwrite = optional(bool)
  }))
  default = {}
}

# For complex record types that need the data block
variable "complex_records" {
  description = "Map of complex DNS records to create (using data block)"
  type = map(object({
    name            = string
    type            = string # SRV, LOC, MX, etc.
    proxied         = optional(bool)
    ttl             = optional(number)
    comment         = optional(string)
    tags            = optional(set(string))
    priority        = optional(number)
    allow_overwrite = optional(bool)

    # data block fields for various record types
    data = optional(object({
      # SRV record fields
      service  = optional(string)
      proto    = optional(string)
      name     = optional(string)
      priority = optional(number)
      weight   = optional(number)
      port     = optional(number)
      target   = optional(string)

      # MX record fields
      preference = optional(number)
      value      = optional(string)

      # NAPTR record fields
      order       = optional(number)
      flags       = optional(string)
      regex       = optional(string)
      replacement = optional(string)

      # LOC record fields
      lat_degrees    = optional(number)
      lat_minutes    = optional(number)
      lat_seconds    = optional(number)
      lat_direction  = optional(string)
      long_degrees   = optional(number)
      long_minutes   = optional(number)
      long_seconds   = optional(number)
      long_direction = optional(string)
      altitude       = optional(number)
      size           = optional(number)
      precision_horz = optional(number)
      precision_vert = optional(number)

      # CAA record fields
      tag = optional(string)

      # SSHFP record fields
      algorithm   = optional(number)
      type        = optional(number)
      fingerprint = optional(string)

      # TLSA/SMIMEA/CERT record fields
      usage         = optional(number)
      selector      = optional(number)
      matching_type = optional(number)
      certificate   = optional(string)

      # DS/DNSKEY record fields
      key_tag     = optional(number)
      digest_type = optional(number)
      digest      = optional(string)
      public_key  = optional(string)

      # Other fields for future compatibility
      content = optional(string)
    }))
  }))
  default = {}
}
