output "id" {
  description = "Tunnel ID"
  value       = cloudflare_zero_trust_tunnel_cloudflared.this.id
}

output "cname" {
  description = "Tunnel CNAME for DNS records"
  value       = cloudflare_zero_trust_tunnel_cloudflared.this.cname
}

output "tunnel_token" {
  description = "Tunnel token for connector deployment"
  value       = cloudflare_zero_trust_tunnel_cloudflared.this.tunnel_token
  sensitive   = true
}

output "vnet_id" {
  description = "Virtual network ID if created"
  value       = var.vnet_name != null ? cloudflare_zero_trust_tunnel_virtual_network.this[0].id : null
}
