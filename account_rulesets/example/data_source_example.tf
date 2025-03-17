# This is an example file showing how to use the data source module
# It is not meant to be applied directly

/*
# Example 1: Look up a specific ruleset by ID
module "account_rulesets" {
  source = "./account_rulesets"
  
  # Credentials and IDs
  cloudflare_account_id  = var.cloudflare_account_id
  cloudflare_zone_id     = var.cloudflare_zone_id
  account_owasp_pub_key  = var.account_owasp_pub_key
  account_owasp_priv_key = var.account_owasp_priv_key
  account_managed_pub_key = var.account_managed_pub_key
  account_managed_priv_key = var.account_managed_priv_key
  
  # Enable data lookup for a specific ruleset
  enable_data_lookup = true
  lookup_ruleset_id  = "2f2feab2026849078ba485f918791bdc"
}

# Example 2: Retrieve all rulesets with a filter
module "account_rulesets_all" {
  source = "./account_rulesets"
  
  # Credentials and IDs
  cloudflare_account_id  = var.cloudflare_account_id
  cloudflare_zone_id     = var.cloudflare_zone_id
  account_owasp_pub_key  = var.account_owasp_pub_key
  account_owasp_priv_key = var.account_owasp_priv_key
  account_managed_pub_key = var.account_managed_pub_key
  account_managed_priv_key = var.account_managed_priv_key
  
  # Enable data lookup for all rulesets with a filter
  enable_data_lookup   = true
  retrieve_all_rulesets = true
  ruleset_filter       = {
    phase = "http_request_firewall_managed"
    kind  = "managed"
  }
}

# Example 3: Use data source in isolation
module "data_source_only" {
  source = "./account_rulesets/modules/data_source"
  
  account_id   = var.cloudflare_account_id
  retrieve_all = true
  filter       = {
    name  = ".*OWASP.*"
    phase = "http_request_firewall_managed"
  }
}

# Then you can use the outputs
output "owasp_rulesets" {
  value = module.data_source_only.all_rulesets
}
*/