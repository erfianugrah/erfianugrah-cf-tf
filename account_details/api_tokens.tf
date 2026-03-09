resource "cloudflare_api_token" "root_token" {
  name = "root_token"

  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["API Tokens Write"]
    ]
    resources = {
      "com.cloudflare.api.user.${var.cloudflare_user_id}" = "*"
    }
  }

  not_before = "2024-03-12T07:15:00Z"
  expires_on = "2030-03-12T07:15:00Z"
}

resource "cloudflare_api_token" "traefik_dns" {
  name = "traefik_dns_account"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "gatekeeper_dns" {
  name = "gatekeeper_dns_account"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "caddy_dns" {
  name = "caddy_dns_account"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "gloryhole_dns" {
  name = "gloryhole_dns_account"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "insomnia" {
  name = "insomnia"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.zone["Analytics Read"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }

  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.account["Account Analytics Read"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
}

resource "cloudflare_api_token" "cloudflare_exporter" {
  name = "cloudflare_exporter"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.zone["Analytics Read"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "admin_r2_read_write_token" {
  name = "admin_r2_read_write_token"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Read"]
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}

resource "cloudflare_api_token" "cache_purge" {
  name = "cache_purge"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Cache Purge"]
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}

resource "cloudflare_api_token" "kv_admin" {
  name = "kv_admin"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Write"]
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}

resource "cloudflare_api_token" "radar" {
  name = "radar"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Radar Read"]
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}

resource "cloudflare_api_token" "dev_platform" {
  name = "dev_platform"

  # Account-level Developer Platform permissions
  policy {
    effect = "allow"
    permission_groups = [
      # Workers
      data.cloudflare_api_token_permission_groups.all.account["Workers Scripts Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Data Catalog Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Data Catalog Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 SQL Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Tail Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Scripts Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Containers Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Containers Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers CI Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers CI Read"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Observability Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Observability Read"],
      # Pages
      data.cloudflare_api_token_permission_groups.all.account["Pages Write"],
      data.cloudflare_api_token_permission_groups.all.account["Pages Read"],
      # D1
      data.cloudflare_api_token_permission_groups.all.account["D1 Write"],
      data.cloudflare_api_token_permission_groups.all.account["D1 Read"],
      # Queues
      data.cloudflare_api_token_permission_groups.all.account["Queues Write"],
      data.cloudflare_api_token_permission_groups.all.account["Queues Read"],
      # Pipelines
      data.cloudflare_api_token_permission_groups.all.account["Pipelines Write"],
      data.cloudflare_api_token_permission_groups.all.account["Pipelines Read"],
      data.cloudflare_api_token_permission_groups.all.account["Pipelines Send"],
      # Hyperdrive
      data.cloudflare_api_token_permission_groups.all.account["Hyperdrive Write"],
      data.cloudflare_api_token_permission_groups.all.account["Hyperdrive Read"],
      # Vectorize
      data.cloudflare_api_token_permission_groups.all.account["Vectorize Write"],
      data.cloudflare_api_token_permission_groups.all.account["Vectorize Read"],
      # Workers AI
      data.cloudflare_api_token_permission_groups.all.account["Workers AI Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers AI Read"],
      # AI Gateway
      data.cloudflare_api_token_permission_groups.all.account["AI Gateway Write"],
      data.cloudflare_api_token_permission_groups.all.account["AI Gateway Read"],
      data.cloudflare_api_token_permission_groups.all.account["AI Gateway Run"],
      # AI Search
      data.cloudflare_api_token_permission_groups.all.account["AI Search Write"],
      data.cloudflare_api_token_permission_groups.all.account["AI Search Read"],
      data.cloudflare_api_token_permission_groups.all.account["AI Search Run"],
      data.cloudflare_api_token_permission_groups.all.account["AI Search Index Engine"],
      # Secrets Store
      data.cloudflare_api_token_permission_groups.all.account["Secrets Store Write"],
      data.cloudflare_api_token_permission_groups.all.account["Secrets Store Read"],
      # Browser Rendering
      data.cloudflare_api_token_permission_groups.all.account["Browser Rendering Write"],
      data.cloudflare_api_token_permission_groups.all.account["Browser Rendering Read"],
      # Constellation
      data.cloudflare_api_token_permission_groups.all.account["Constellation Write"],
      data.cloudflare_api_token_permission_groups.all.account["Constellation Read"],
      # Calls
      data.cloudflare_api_token_permission_groups.all.account["Calls Write"],
      data.cloudflare_api_token_permission_groups.all.account["Calls Read"],
      # Pubsub
      data.cloudflare_api_token_permission_groups.all.account["Pubsub Configuration Write"],
      # Account Settings (needed for wrangler/dashboard operations)
      data.cloudflare_api_token_permission_groups.all.account["Account Settings Read"],
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }

  # Zone-level permissions for Workers Routes
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Workers Routes Write"],
      data.cloudflare_api_token_permission_groups.all.zone["Workers Routes Read"],
      # AI Audit (zone-scoped)
      data.cloudflare_api_token_permission_groups.all.zone["AI Audit Write"],
      data.cloudflare_api_token_permission_groups.all.zone["AI Audit Read"],
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }

  # User-level permissions for wrangler whoami etc.
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["User Details Read"],
    ]
    resources = {
      "com.cloudflare.api.user.${var.cloudflare_user_id}" = "*"
    }
  }
}

# Example templates for different token types (commented out)

/*
# R2 Bucket-specific token template
resource "cloudflare_api_token" "r2_specific_bucket_token" {
  name = "r2_specific_bucket_token"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Read"],
      # Optionally add write permissions if needed
      # data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Write"]
    ]
    resources = {
      # Format for R2 bucket-specific access:
      "com.cloudflare.api.account.${var.cloudflare_account_id}:r2:bucket_name_here" = "*"
      # Add more buckets as needed:
      # "com.cloudflare.api.account.${var.cloudflare_account_id}:r2:another_bucket" = "*"
    }
  }
}

# Token with IP restrictions template
resource "cloudflare_api_token" "ip_restricted_token" {
  name = "ip_restricted_token"
  
  # Define the policy as needed
  policy {
    effect = "allow"
    permission_groups = [
      # Replace with your required permissions
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
  
  # IP restrictions
  condition {
    request_ip {
      # IPs/CIDR ranges that are allowed to use this token
      in = ["192.168.1.0/24", "10.0.0.1/32"]
      
      # Optionally, specify IPs to explicitly deny
      # not_in = ["192.168.1.100/32"]
    }
  }
}

# Time-limited token template
resource "cloudflare_api_token" "temporary_token" {
  name = "temporary_token"
  
  policy {
    effect = "allow"
    permission_groups = [
      # Replace with required permissions
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
  
  # Token only valid starting from this time
  not_before = "2023-01-01T00:00:00Z"
  
  # Token expires at this time
  expires_on = "2023-12-31T23:59:59Z"
}
*/
