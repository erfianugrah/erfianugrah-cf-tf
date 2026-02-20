output "tunnel_token_erfipie" {
  value     = module.tunnel_erfipie.tunnel_token
  sensitive = true
}

output "tunnel_token_kvm_nl" {
  value     = module.tunnel_kvm_nl.tunnel_token
  sensitive = true
}

output "tunnel_token_kvm_sg" {
  value     = module.tunnel_kvm_sg.tunnel_token
  sensitive = true
}

output "tunnel_token_servarr" {
  value     = module.tunnel_servarr.tunnel_token
  sensitive = true
}

output "tunnel_token_vyos_nl" {
  value     = module.tunnel_vyos_nl.tunnel_token
  sensitive = true
}

output "tunnel_token_vyos_sg" {
  value     = module.tunnel_vyos_sg.tunnel_token
  sensitive = true
}

output "turnstile_authentik_secret_key" {
  value     = cloudflare_turnstile_widget.authentik.secret
  sensitive = true
}

output "turnstile_interstitial_secret_key" {
  value     = cloudflare_turnstile_widget.interstitial.secret
  sensitive = true
}

output "waf_summary" {
  description = "Managed WAF rulesets summary (name, id, version, rule count)"
  value = {
    for rs in data.cloudflare_rulesets.managed_waf.rulesets : rs.name => {
      id          = rs.id
      version     = rs.version
      rules_count = length(rs.rules)
    }
  }
}

output "waf_rule_lookup" {
  description = "Per-ruleset rule ID => description lookup (use: tofu output -json waf_rule_lookup | jq '.\"Cloudflare Managed Ruleset\"')"
  value = {
    for rs in data.cloudflare_rulesets.managed_waf.rulesets : rs.name => {
      for rule in rs.rules : rule.id => rule.description
    }
  }
}


