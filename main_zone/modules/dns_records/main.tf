# Create simple DNS records (using content field)
resource "cloudflare_record" "simple" {
  for_each = var.records
  
  # Required fields
  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  
  # Optional fields with dynamic assignments to avoid null values
  proxied         = each.value.proxied != null ? each.value.proxied : null
  ttl             = each.value.ttl != null ? each.value.ttl : null
  comment         = each.value.comment != null ? each.value.comment : null
  priority        = each.value.priority != null ? each.value.priority : null
  allow_overwrite = each.value.allow_overwrite != null ? each.value.allow_overwrite : null
  
  # Tags need special handling since it's a set
  tags = each.value.tags != null ? each.value.tags : []
  
  # Add timeouts block if needed
  timeouts {
    create = "2m"
    update = "2m"
  }
}

# Create complex DNS records (using data block)
resource "cloudflare_record" "complex" {
  for_each = var.complex_records
  
  # Required fields
  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  
  # Optional fields with dynamic assignments to avoid null values
  proxied         = each.value.proxied != null ? each.value.proxied : null
  ttl             = each.value.ttl != null ? each.value.ttl : null
  comment         = each.value.comment != null ? each.value.comment : null
  priority        = each.value.priority != null ? each.value.priority : null
  allow_overwrite = each.value.allow_overwrite != null ? each.value.allow_overwrite : null
  
  # Tags need special handling since it's a set
  tags = each.value.tags != null ? each.value.tags : []
  
  # Add the data block for complex record types
  dynamic "data" {
    for_each = each.value.data != null ? [each.value.data] : []
    content {
      # Only use the fields that are provided in the data block
      # SRV record fields
      service   = lookup(data.value, "service", null)
      proto     = lookup(data.value, "proto", null)
      name      = lookup(data.value, "name", null)
      priority  = lookup(data.value, "priority", null)
      weight    = lookup(data.value, "weight", null)
      port      = lookup(data.value, "port", null)
      target    = lookup(data.value, "target", null)
      
      # MX record fields
      preference = lookup(data.value, "preference", null)
      value      = lookup(data.value, "value", null)
      
      # NAPTR record fields
      order       = lookup(data.value, "order", null)
      flags       = lookup(data.value, "flags", null)
      regex       = lookup(data.value, "regex", null)
      replacement = lookup(data.value, "replacement", null)
      
      # LOC record fields
      lat_degrees   = lookup(data.value, "lat_degrees", null)
      lat_minutes   = lookup(data.value, "lat_minutes", null)
      lat_seconds   = lookup(data.value, "lat_seconds", null)
      lat_direction = lookup(data.value, "lat_direction", null)
      long_degrees  = lookup(data.value, "long_degrees", null)
      long_minutes  = lookup(data.value, "long_minutes", null)
      long_seconds  = lookup(data.value, "long_seconds", null)
      long_direction = lookup(data.value, "long_direction", null)
      altitude      = lookup(data.value, "altitude", null)
      size          = lookup(data.value, "size", null)
      precision_horz = lookup(data.value, "precision_horz", null)
      precision_vert = lookup(data.value, "precision_vert", null)
      
      # CAA record fields
      tag = lookup(data.value, "tag", null)
      
      # SSHFP record fields
      algorithm   = lookup(data.value, "algorithm", null)
      type        = lookup(data.value, "type", null)
      fingerprint = lookup(data.value, "fingerprint", null)
      
      # TLSA/SMIMEA/CERT record fields
      usage         = lookup(data.value, "usage", null)
      selector      = lookup(data.value, "selector", null)
      matching_type = lookup(data.value, "matching_type", null)
      certificate   = lookup(data.value, "certificate", null)
      
      # DS/DNSKEY record fields
      key_tag     = lookup(data.value, "key_tag", null)
      digest_type = lookup(data.value, "digest_type", null)
      digest      = lookup(data.value, "digest", null)
      public_key  = lookup(data.value, "public_key", null)
      
      # Other fields
      content = lookup(data.value, "content", null)
    }
  }
  
  # Add timeouts block
  timeouts {
    create = "2m"
    update = "2m"
  }
}