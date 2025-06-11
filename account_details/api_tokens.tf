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

resource "cloudflare_api_token" "proxmox_dns" {
  name = "proxmox_dns_account"
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

resource "cloudflare_api_token" "wrangler" {
  name = "wrangler"
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Workers Routes Write"]
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["User Details Read"]
    ]
    resources = {
      "com.cloudflare.api.user.${var.cloudflare_user_id}" = "*"
    }
  }
  policy {
    effect = "allow"
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Scripts Write"],
      data.cloudflare_api_token_permission_groups.all.account["Account Settings Read"],
      data.cloudflare_api_token_permission_groups.all.account["Pages Write"]
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
