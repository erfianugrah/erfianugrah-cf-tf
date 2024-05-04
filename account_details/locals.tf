locals {
  roles_by_name = {
    for role in data.cloudflare_account_roles.account_roles.roles :
      role.name => role
  }
}
