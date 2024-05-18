resource "cloudflare_api_token" "root_token" {
  name = "root_token"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["API Tokens Write"],
      # "686d18d5ac6c441c867cbf6771e58a0a", # "API Tokens Write"
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
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      # "4755a26eedb94da69e1066d98aa820be", # "DNS Write"
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
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
      # "4755a26eedb94da69e1066d98aa820be", # "DNS Write"
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
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.zone["Analytics Read"],
      # "c4a30cd58c5d42619c86a3c36c441e2d", # "Logs Read"
      # "9c88f9c5bce24ce7af9a958ba9c504db" # "Analytics Read"
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.account["Account Analytics Read"],
      # "b89a480218d04ceb98b4fe57ca29dc1f", # "Account Analytics Read"
      # "6a315a56f18441e59ed03352369ae956" # "Logs Read"
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
}

resource "cloudflare_api_token" "cloudflare_exporter" {
  name = "cloudflare_exporter"
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Logs Read"],
      data.cloudflare_api_token_permission_groups.all.zone["Analytics Read"],
      # "c4a30cd58c5d42619c86a3c36c441e2d", # "Logs Read"
      # "9c88f9c5bce24ce7af9a958ba9c504db" # "Analytics Read"
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = jsonencode({
        "com.cloudflare.api.account.zone.*" = "*"
      })
    }
  }
}

resource "cloudflare_api_token" "logpush_r2_token" {
  name = "logpush_r2_token"
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers R2 Storage Write"],
      /*       "bf7481a1826f439697cb59a20b22293e", # "Workers R2 Storage Write" */
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}

resource "cloudflare_api_token" "wrangler" {
  name = "wrangler"
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.zone["Workers Routes Write"],
      /* "28f4b596e7d643029c524985477ae49a", # "Workers Routes Write" */
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.user["User Details Read"],
      /* "8acbe5bb0d54464ab867149d7f7cf8ac", # "User Details Read" */
    ]
    resources = {
      "com.cloudflare.api.user.${var.cloudflare_user_id}" = "*"
    }
  }
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Workers KV Storage Write"],
      data.cloudflare_api_token_permission_groups.all.account["Workers Scripts Write"],
      data.cloudflare_api_token_permission_groups.all.account["Account Settings Read"],
      # "f7f0eda5697f475c90846e879bab8666", # "Workers KV Storage Write"
      # "e086da7e2179491d91ee5f35b3ca210a", #  "Workers Scripts Write"
      # "c1fde68c7bcc44588cbb6ddbc16d6480" # "Account Settings Read"
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*"
    }
  }
}
