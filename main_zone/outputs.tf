output "tunnel_token_erfipie" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.erfipie.tunnel_token
  sensitive = true
}

output "tunnel_token_kvm_nl" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.tunnel_token
  sensitive = true
}

output "tunnel_token_kvm_sg" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.kvm_nl.tunnel_token
  sensitive = true
}

output "tunnel_token_servarr" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.servarr.tunnel_token
  sensitive = true
}

output "tunnel_token_vyos_nl" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.tunnel_token
  sensitive = true
}

output "tunnel_token_vyos_sg" {
  value     = cloudflare_zero_trust_tunnel_cloudflared.vyos_nl.tunnel_token
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

output "managed_waf_rulesets" {
  description = "List of all managed WAF rulesets"
  value = {
    for ruleset in data.cloudflare_rulesets.managed_waf.rulesets : ruleset.name => {
      id          = ruleset.id
      description = ruleset.description
      version     = ruleset.version
      rules_count = length(ruleset.rules)
      rules = [
        for rule in ruleset.rules : {
          id          = rule.id
          description = rule.description
          enabled     = rule.enabled
          action      = rule.action
        }
      ]
    }
  }
}

output "owasp_rulesets" {
  description = "List of OWASP-specific rulesets"
  value = {
    for ruleset in data.cloudflare_rulesets.owasp.rulesets : ruleset.name => {
      id          = ruleset.id
      description = ruleset.description
      version     = ruleset.version
      rules_count = length(ruleset.rules)
      rules = [
        for rule in ruleset.rules : {
          id          = rule.id
          description = rule.description
          enabled     = rule.enabled
          action      = rule.action
        }
      ]
    }
  }
}


