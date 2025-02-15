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


