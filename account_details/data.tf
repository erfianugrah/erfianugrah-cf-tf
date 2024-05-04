data "cloudflare_account_roles" "account_roles" {
    account_id = var.cloudflare_account_id
}

data "cloudflare_api_token_permission_groups" "all" {}
