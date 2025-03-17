# Cloudflare Certificate Packs Module

This module creates certificate packs for a Cloudflare zone based on DNS records.

## Usage

```hcl
# First create DNS records using the dns_records module
module "media_dns" {
  source = "./modules/dns_records"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
  records = {
    # DNS record definitions
  }
}

# Then create certificates based on those records
module "media_certs" {
  source = "./modules/certificate_packs"
  
  zone_id           = var.cloudflare_zone_id
  domain_name       = var.domain_name
  create_wildcard_cert = true
  dns_records       = module.media_dns.records
  
  # Optional customizations
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
  cert_types            = ["A", "AAAA", "CNAME"]
}
```

## Features

- Automatically creates certificates for DNS records
- Option to create a wildcard certificate for the domain
- Filter which record types get certificates
- Consistent certificate validation method and duration

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| zone_id | The Cloudflare Zone ID | string | | Yes |
| domain_name | The domain name for the zone | string | | Yes |
| create_wildcard_cert | Whether to create a wildcard certificate | bool | true | No |
| dns_records | Map of DNS records from the dns_records module | map(any) | {} | No |
| certificate_authority | The certificate authority to use | string | "lets_encrypt" | No |
| validation_method | The validation method to use | string | "txt" | No |
| validity_days | The validity period in days | number | 90 | No |
| cert_types | List of record types to create certificates for | list(string) | ["A", "AAAA", "CNAME"] | No |

## Outputs

| Name | Description |
|------|-------------|
| certificates | Map of all created certificate packs |
| certificate_count | Total number of certificates created |
| certificate_hosts | Map of all hosts covered by certificates |
| wildcard_certificate | The wildcard certificate if created |