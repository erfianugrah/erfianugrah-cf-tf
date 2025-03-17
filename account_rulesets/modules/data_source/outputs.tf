output "ruleset" {
  description = "The retrieved ruleset information"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0], null) : null
}

output "all_rulesets" {
  description = "All retrieved rulesets"
  value       = var.retrieve_all ? try(data.cloudflare_rulesets.all_rulesets[0], null) : null
}

output "filtered_rulesets" {
  description = "The filtered rulesets based on provided filter criteria"
  value       = local.filtered_rulesets
}

output "ruleset_id" {
  description = "The ID of the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].id, null) : null
}

output "ruleset_name" {
  description = "The name of the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].name, null) : null
}

output "ruleset_description" {
  description = "The description of the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].description, null) : null
}

output "ruleset_kind" {
  description = "The kind of the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].kind, null) : null
}

output "ruleset_phase" {
  description = "The phase of the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].phase, null) : null
}

output "ruleset_rules" {
  description = "The rules in the retrieved ruleset"
  value       = var.ruleset_id != null ? try(data.cloudflare_ruleset.ruleset[0].rules, null) : null
}

output "owasp_ruleset" {
  description = "The OWASP ruleset if it exists in the retrieved rulesets"
  value = var.retrieve_all ? try([
    for ruleset in data.cloudflare_rulesets.all_rulesets[0].result : ruleset
    if ruleset.phase == "http_request_firewall_managed" &&
    can(regex(".*OWASP.*", ruleset.name))
  ][0], null) : null
}

output "cloudflare_managed_ruleset" {
  description = "The Cloudflare Managed ruleset if it exists in the retrieved rulesets"
  value = var.retrieve_all ? try([
    for ruleset in data.cloudflare_rulesets.all_rulesets[0].result : ruleset
    if ruleset.phase == "http_request_firewall_managed" &&
    ruleset.name == "Cloudflare Managed Ruleset"
  ][0], null) : null
}