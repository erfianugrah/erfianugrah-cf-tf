data "cloudflare_account_roles" "account_roles" {
  account_id = var.cloudflare_account_id
}

data "cloudflare_api_token_permission_groups" "all" {}

data "http" "first_page" {
  url = "https://api.cloudflare.com/client/v4/accounts?per_page=50"

  request_headers = {
    "X-Auth-Email" = var.cloudflare_email
    "X-Auth-Key"   = var.cloudflare_api_key
    "Content-Type" = "application/json"
  }
}

data "http" "remaining_pages" {
  for_each = local.success ? toset([for p in local.remaining_pages : tostring(p)]) : toset([])

  url = "https://api.cloudflare.com/client/v4/accounts?page=${each.value}&per_page=50"

  request_headers = {
    "X-Auth-Email" = var.cloudflare_email
    "X-Auth-Key"   = var.cloudflare_api_key
    "Content-Type" = "application/json"
  }
}
