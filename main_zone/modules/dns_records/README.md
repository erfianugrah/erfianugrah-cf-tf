# Cloudflare DNS Records Module

This module creates DNS records in a Cloudflare zone and provides useful outputs for record management.

## Usage

```hcl
module "media_services_dns" {
  source = "./modules/dns_records"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
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
      content = cloudflare_zero_trust_tunnel_cloudflared.servarr.cname
      proxied = true
      ttl     = 1
      comment = "Jellyfin Media Server"
      tags    = ["media", "servarr"]
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

| Name | Description | Type | Required |
|------|-------------|------|----------|
| zone_id | The Cloudflare Zone ID | string | Yes |
| domain_name | The domain name for the zone | string | Yes |
| records | Map of DNS records to create | map(object) | Yes |

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

## Outputs

| Name | Description |
|------|-------------|
| records | Map of all created DNS records |
| fqdns | Map of FQDNs for all created records |
| records_by_type | Maps of records grouped by record type (a_records, aaaa_records, etc.) |
| count_by_type | Count of records by type |