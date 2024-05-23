resource "cloudflare_account_member" "main_email" {
  account_id    = var.cloudflare_account_id
  email_address = var.cloudflare_email
  role_ids = [
    local.roles_by_name["Super Administrator - All Privileges"].id
  ]
}

resource "cloudflare_account_member" "outlook_email" {
  account_id    = var.cloudflare_account_id
  email_address = var.cloudflare_outlook_email
  role_ids = [
    local.roles_by_name["Super Administrator - All Privileges"].id
  ]
}

resource "cloudflare_account_member" "workspace_email" {
  account_id    = var.cloudflare_account_id
  email_address = var.cloudflare_workspace_email
  role_ids = [
    local.roles_by_name["Super Administrator - All Privileges"].id
  ]
}

resource "cloudflare_account_member" "work_email" {
  account_id    = var.cloudflare_account_id
  email_address = var.cloudflare_work_email
  role_ids = [
    local.roles_by_name["Super Administrator - All Privileges"].id
  ]
}
