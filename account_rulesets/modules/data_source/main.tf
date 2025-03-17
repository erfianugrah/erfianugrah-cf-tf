# Ruleset Data Source Module

data "cloudflare_ruleset" "ruleset" {
  count      = var.ruleset_id != null ? 1 : 0
  ruleset_id = var.ruleset_id
  account_id = var.account_id != null && var.zone_id == null ? var.account_id : null
  zone_id    = var.zone_id != null && var.account_id == null ? var.zone_id : null
}

# Note: In this version of the Cloudflare provider, 
# filtering must be done at the client level after data retrieval
data "cloudflare_rulesets" "all_rulesets" {
  count      = var.retrieve_all ? 1 : 0
  account_id = var.account_id != null && var.zone_id == null ? var.account_id : null
  zone_id    = var.zone_id != null && var.account_id == null ? var.zone_id : null
}

# Apply client-side filtering using locals
locals {
  # Only process if we're retrieving all rulesets and a filter is provided
  filtered_rulesets = var.retrieve_all && var.filter != null ? [
    for ruleset in data.cloudflare_rulesets.all_rulesets[0].result : ruleset
    if(var.filter.name == null || can(regex(var.filter.name, ruleset.name))) &&
    (var.filter.phase == null || ruleset.phase == var.filter.phase) &&
    (var.filter.kind == null || ruleset.kind == var.filter.kind)
  ] : var.retrieve_all ? data.cloudflare_rulesets.all_rulesets[0].result : []
}