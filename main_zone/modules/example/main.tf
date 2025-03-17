# Example implementation of DNS records and certificates

# Media services DNS records (simple records using content field)
module "media_dns" {
  source = "../dns_records"
  
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
      content = "cloudflare-tunnel.example.com"
      proxied = true
      ttl     = 1
      comment = "Jellyfin Media Server"
      tags    = ["media", "servarr"]
    },
    radarr = {
      name    = "radarr"
      type    = "CNAME"
      content = "cloudflare-tunnel.example.com"
      proxied = true
      ttl     = 1
      comment = "Radarr Movie Management"
      tags    = ["media", "servarr"]
    }
  }
}

# Infrastructure and complex records
module "infra_dns" {
  source = "../dns_records"
  
  zone_id     = var.cloudflare_zone_id
  domain_name = var.domain_name
  
  # Simple A and CNAME records
  records = {
    proxmox = {
      name    = "proxmox"
      type    = "A"
      content = var.sg_ip
      proxied = true
      ttl     = 1
      comment = "Proxmox Virtualization Server"
      tags    = ["infrastructure", "virtualization"]
    },
    monitoring = {
      name    = "monitoring"
      type    = "CNAME" 
      content = "cloudflare-tunnel.example.com"
      proxied = true
      ttl     = 1
      comment = "Monitoring Stack"
      tags    = ["infrastructure", "monitoring"]
    }
  }
  
  # Complex records using data block
  complex_records = {
    # SRV record example
    _sip_server = {
      name    = "_sip._tcp"
      type    = "SRV"
      ttl     = 3600
      proxied = false
      tags    = ["voip"]
      data = {
        service  = "_sip"
        proto    = "_tcp"
        name     = "example"
        priority = 10
        weight   = 5
        port     = 5060
        target   = "sip.${var.domain_name}"
      }
    },
    
    # MX record example
    mx_record = {
      name    = "@"  # Root domain
      type    = "MX"
      ttl     = 3600
      proxied = false
      tags    = ["email"]
      data = {
        preference = 10
        value      = "mx1.${var.domain_name}"
      }
    },
    
    # LOC record example
    location = {
      name    = "office"
      type    = "LOC"
      ttl     = 3600
      proxied = false
      tags    = ["geo"]
      data = {
        lat_degrees   = 37
        lat_minutes   = 46
        lat_seconds   = 30
        lat_direction = "N"
        long_degrees  = 122
        long_minutes  = 25
        long_seconds  = 10
        long_direction = "W"
        altitude      = 10
        size          = 10
        precision_horz = 1000
        precision_vert = 10
      }
    },
    
    # CAA record example
    caa_record = {
      name    = "@"
      type    = "CAA"
      ttl     = 3600
      proxied = false
      tags    = ["security"]
      data = {
        flags = "0"
        tag   = "issue"
        value = "letsencrypt.org"
      }
    },
    
    # SSHFP record example
    ssh_fingerprint = {
      name    = "ssh"
      type    = "SSHFP"
      ttl     = 3600
      proxied = false
      tags    = ["security"]
      data = {
        algorithm   = 2  # RSA
        type        = 1  # SHA-1
        fingerprint = "123456789abcdef67890123456789abcdef67890"
      }
    }
  }
}

# Create certificates for Media services
module "media_certs" {
  source = "../certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  dns_records         = module.media_dns.records_for_certificates
  
  # Optional customizations
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Create certificates for Infrastructure services
module "infra_certs" {
  source = "../certificate_packs"
  
  zone_id             = var.cloudflare_zone_id
  domain_name         = var.domain_name
  create_wildcard_cert = false
  dns_records         = module.infra_dns.records_for_certificates
  
  # Optional customizations
  certificate_authority = "lets_encrypt"
  validation_method     = "txt"
  validity_days         = 90
}

# Global wildcard certificate
resource "cloudflare_certificate_pack" "wildcard" {
  certificate_authority = "lets_encrypt"
  cloudflare_branding   = false
  hosts                 = [var.domain_name, "*.${var.domain_name}"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
  zone_id               = var.cloudflare_zone_id
}