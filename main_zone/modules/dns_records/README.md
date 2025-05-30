# Cloudflare DNS Records Module

This module creates DNS records in a Cloudflare zone and provides useful outputs for record management.

## Features

- Creates both simple and complex DNS records
- Supports all Cloudflare DNS record types (A, AAAA, CNAME, TXT, MX, SRV, etc.)
- Handles complex record types requiring data blocks (SRV, MX, LOC, etc.)
- Provides organized outputs for easy certificate creation
- Returns records grouped by type for convenient access

## Usage

```hcl
module "media_services_dns" {
  source = "./modules/dns_records"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
  # Simple records using content field
  records = {
    plex = {
      name    = "plex"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "Plex Media Server"
      tags    = ["media", "servarr"]
    },
    jellyfin = {
      name    = "jellyfin"
      type    = "CNAME"
      content = "example.domain.com"
      proxied = true
      ttl     = 1
      comment = "Jellyfin Media Server"
      tags    = ["media", "servarr"]
    }
  }
  
  # Complex records using data blocks
  complex_records = {
    mail = {
      name    = "mail"
      type    = "MX"
      ttl     = 3600
      comment = "Mail server"
      tags    = ["email"]
      data = {
        preference = 10
        value      = "mx.example.com"
      }
    }
  }
}

# You can then access the records
resource "cloudflare_certificate_pack" "media_certs" {
  for_each              = module.media_services_dns.records_by_type.a_records
  certificate_authority = "lets_encrypt"
  cloudflare_branding   = false
  hosts                 = ["${each.value.name}.${var.domain_name}"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
  zone_id               = var.cloudflare_zone_id
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| zone_id | The Cloudflare Zone ID | string | | Yes |
| domain_name | The domain name for the zone | string | | Yes |
| records | Map of simple DNS records to create (using content field) | map(object) | {} | No |
| complex_records | Map of complex DNS records to create (using data block) | map(object) | {} | No |

### Simple Record Attributes

Each record in the `records` map supports the following attributes:

- `name` - (Required) The name of the record
- `type` - (Required) The record type (A, AAAA, CNAME, etc.)
- `content` - (Required) The content of the record
- `proxied` - (Optional) Whether the record is proxied
- `ttl` - (Optional) The TTL of the record
- `comment` - (Optional) Comments about the record
- `tags` - (Optional) Set of tags for the record
- `priority` - (Optional) Priority for records that support it
- `allow_overwrite` - (Optional) Allow overwriting existing records

### Complex Record Attributes

Records in the `complex_records` map support all the above attributes except `content`, and include:

- `data` - (Required) Data block for complex record types with specific fields based on record type
  - See variables.tf for all supported fields for each record type

## Outputs

| Name | Description |
|------|-------------|
| all_records | Map of all created DNS records |
| simple_records | Map of simple DNS records (using content field) |
| complex_records | Map of complex DNS records (using data block) |
| fqdns | Map of FQDNs for all created records |
| records_by_type | Maps of records grouped by record type (a_records, aaaa_records, etc.) |
| count_by_type | Count of records by type |
| records_for_certificates | DNS records that can have certificates (A, AAAA, CNAME) |