locals {
  roles_by_name = {
    for role in data.cloudflare_account_roles.account_roles.roles :
    role.name => role
  }
}

locals {
  first_response = jsondecode(data.http.first_page.response_body)

  # Check if request was successful
  success       = try(local.first_response.success, false)
  first_results = local.success ? try(local.first_response.result, []) : []
  total_pages   = local.success ? try(local.first_response.result_info.total_pages, 1) : 0

  # Create list of remaining pages (2, 3, 4, etc.)
  remaining_pages = local.total_pages > 1 ? range(2, local.total_pages + 1) : []
}

locals {
  remaining_results = flatten([
    for page in data.http.remaining_pages :
    try(jsondecode(page.response_body).result, [])
  ])

  accounts = concat(local.first_results, local.remaining_results)
}

