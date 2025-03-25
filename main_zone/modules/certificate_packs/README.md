# Cloudflare Certificate Packs Module

This module creates certificate packs for a Cloudflare zone based on DNS records.

## Features

- Automatically creates Advanced certificates for DNS records
- Creates a wildcard certificate for the domain (optional)
- Intelligently filters out DCV (Domain Control Validation) records
- Supports customizing certificate validity period and authority
- Provides organized outputs for certificate management
- Waits for active status (optional)

## Usage

### Multiple Certificates Example

```hcl
# First create DNS records using the dns_records module
module "media_dns" {
  source = "./modules/dns_records"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
  records = {
    # DNS record definitions
    webserver = {
      name    = "web"
      type    = "A"
      content = "192.0.2.1"
      proxied = true
    },
    api = {
      name    = "api"
      type    = "CNAME"
      content = "api-backend.example.com"
      proxied = true
    }
  }
}

# Then create certificates based on those records
module "media_certs" {
  source = "./modules/certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = true
  dns_records         = module.media_dns.records_for_certificates
  
  # Optional customizations
  certificate_authority  = "lets_encrypt"
  validation_method      = "txt"
  validity_days          = 90
  cert_types             = ["A", "AAAA", "CNAME"]
  wait_for_active_status = true
}
```

### Single Certificate Example

```hcl
module "single_cert" {
  source = "./modules/certificate_packs"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
  # Skip the wildcard cert
  create_wildcard_cert = false
  
  # Just specify the single record you want a certificate for
  dns_records = {
    webserver = {
      name    = "web"
      type    = "A"
      proxied = true  # Include any required fields
    }
  }
}
```

## How It Works

1. The module takes DNS records as input (ideally from the `dns_records` module's `records_for_certificates` output)
2. It filters out DCV records that shouldn't have certificates
3. If enabled, it creates a wildcard certificate for the domain and all subdomains (`*.domain.com`)
4. It creates individual certificates for each filtered DNS record
5. All certificates use Advanced type with consistent settings

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
| wait_for_active_status | Whether to wait for certificates to reach active status | bool | false | No |
| cert_types | List of record types to create certificates for | list(string) | ["A", "AAAA", "CNAME"] | No |

## Outputs

| Name | Description |
|------|-------------|
| certificates | Map of all created certificate packs |
| certificate_count | Total number of certificates created |
| certificate_hosts | Map of all hosts covered by certificates |
| wildcard_certificate | The wildcard certificate if created |

## Notes

- This module works best when paired with the `dns_records` module
- All certificates created are Advanced type without Cloudflare branding
- DNS records with validation or DCV-related names are automatically filtered out
- Use `wait_for_active_status = true` when you need to ensure certificates are fully provisioned