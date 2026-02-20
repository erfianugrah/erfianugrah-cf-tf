# Main Zone Refactoring Plan

## Current State

- 62 root-level .tf files, 3 child modules (`dns_records`, `certificate_packs`, `example`)
- 3 zones managed from a single workspace: primary (`erfianugrah.com`), secondary (`erfi.dev`), tertiary (`erfi.io`)
- 7 tunnels across 5 files (`tunnel.tf`, `tunnel_config.tf`, `tunnel_secret.tf`, `tunnel_route.tf`, `tunnel_vnet.tf`)
- All 7 tunnels share a single `random_string.tunnel_secret` (security anti-pattern)
- Zone/domain references use `var.domain_name` / `var.secondary_domain_name` / `var.thirdary_domain_name` ("thirdary" is a typo for "tertiary")

## Completed

- [x] Certificate module redesigned: wildcard mode (default) with auto multi-level subdomain detection, per-host mode (Total TLS style), or none
- [x] Collapsed 6 cert module calls to 3 (one per zone), down from ~51 individual cert packs to ~6 wildcards
- [x] Removed provider blocks from child modules (inherit from root)
- [x] Removed unused `random` provider from child modules
- [x] DNS module: removed redundant null ternaries, fixed `fqdns` output bug (`domain.domain` for apex records), removed wasteful `records_by_type`/`count_by_type` outputs
- [x] Fixed copy-paste bugs in `outputs.tf` (tunnel tokens for `kvm_sg` and `vyos_sg` referenced wrong tunnels)
- [x] State migration: moved KVM records from `proxmox_dns` to `kvm_dns`, removed all proxmox/proxmox_secondary DNS records, tunnel, config, and certs from state
- [x] State migration: removed all 51 old per-host cert resources from state

## Phase 1: Tunnel Module

### Design

New module at `modules/tunnel/` that encapsulates:
- `random_string` (per-tunnel secret)
- `cloudflare_zero_trust_tunnel_cloudflared`
- `cloudflare_zero_trust_tunnel_cloudflared_config` (dynamic ingress rules)
- `cloudflare_zero_trust_tunnel_virtual_network` (optional)
- `cloudflare_zero_trust_tunnel_route` (optional)

### Interface

```hcl
module "tunnel_servarr" {
  source     = "./modules/tunnel"
  account_id = var.cloudflare_account_id
  name       = "servarr"

  ingress_rules = [
    { hostname = "radarr.${var.thirdary_domain_name}",  service = "http://172.19.1.2:7878" },
    { hostname = "sonarr.${var.thirdary_domain_name}",  service = "http://172.19.1.3:8989" },
    # ...
    { service = "http_status:404" },  # catch-all must be last
  ]

  vnet_name = "servarr_vnet"
  route     = { network = "172.19.0.0/16" }
}
```

### Variables

```hcl
variable "account_id" { type = string }
variable "name" { type = string }
variable "warp_routing" { type = bool, default = true }

variable "ingress_rules" {
  type = list(object({
    hostname = optional(string)   # null = catch-all
    path     = optional(string)
    service  = string
    origin_request = optional(object({
      no_tls_verify      = optional(bool)
      http2_origin       = optional(bool)
      origin_server_name = optional(string)
      http_host_header   = optional(string)
      access = optional(object({
        required  = bool
        team_name = string
        aud_tag   = list(string)
      }))
    }))
  }))
  # Validation: last rule must be catch-all (hostname == null)
}

variable "route" {
  type = object({ network = string, comment = optional(string) })
  default = null
}

variable "vnet_name" {
  type    = string
  default = null
}
```

### Outputs

```hcl
output "id"           # tunnel ID
output "cname"        # tunnel CNAME for DNS records
output "tunnel_token" # sensitive, for connector deployment
output "vnet_id"      # virtual network ID if created
```

### State Migration

Per tunnel (7 total), example for servarr:

```bash
tofu state mv 'cloudflare_zero_trust_tunnel_cloudflared.servarr' \
  'module.tunnel_servarr.cloudflare_zero_trust_tunnel_cloudflared.this'
tofu state mv 'cloudflare_zero_trust_tunnel_cloudflared_config.servarr' \
  'module.tunnel_servarr.cloudflare_zero_trust_tunnel_cloudflared_config.this'
tofu state mv 'cloudflare_zero_trust_tunnel_virtual_network.servarr' \
  'module.tunnel_servarr.cloudflare_zero_trust_tunnel_virtual_network.this[0]'
tofu state mv 'cloudflare_zero_trust_tunnel_route.servarr' \
  'module.tunnel_servarr.cloudflare_zero_trust_tunnel_route.this[0]'
```

The shared `random_string.tunnel_secret` cannot be split into 7. Options:
1. **Accept secret rotation** — let each module create a new secret; redeploy all 7 connectors once.
2. **Import existing** — `tofu state rm random_string.tunnel_secret`, let modules create new ones (same effect as option 1).

### Files Replaced

- `tunnel.tf` -> removed
- `tunnel_config.tf` -> removed
- `tunnel_secret.tf` -> removed
- `tunnel_route.tf` -> removed
- `tunnel_vnet.tf` -> removed
- New: `tunnels.tf` (all 7 module calls)

### DNS Reference Changes

All `cloudflare_zero_trust_tunnel_cloudflared.<name>.cname` references in `dns.tf`, `dns_servarr.tf` change to `module.tunnel_<name>.cname`.

---

## Phase 2: Zone/Domain Naming Cleanup

### Problem

- `var.thirdary_domain_name` is a typo ("tertiary")
- Zone references are scattered: `var.cloudflare_zone_id`, `var.secondary_cloudflare_zone_id`, `var.thirdary_cloudflare_zone_id`
- Some resources use `cloudflare_zone.erfianugrah.id` while others use `var.cloudflare_zone_id` for the same zone

### Solution

Add a zones map in locals as a translation layer (no variable renames needed):

```hcl
locals {
  zones = {
    primary   = { zone_id = var.cloudflare_zone_id,           domain = var.domain_name }
    secondary = { zone_id = var.secondary_cloudflare_zone_id, domain = var.secondary_domain_name }
    tertiary  = { zone_id = var.thirdary_cloudflare_zone_id,  domain = var.thirdary_domain_name }
  }
}
```

Usage: `local.zones.primary.domain`, `local.zones.tertiary.zone_id`

Migrate gradually — no state changes needed, purely config refactor.

---

## Phase 3: Cleanup

### Dead Files to Remove
- `records.tf` (empty)
- 8 fully commented-out files: `aop_certs.tf`, `aop_per_hostname.tf`, `aop_per_zone.tf`, `custom_error_pages.tf`, `custom_hostnames.tf`, `custom_ssl.tf`, `mtls_certs.tf`, `web_analytics_rule.tf`
- `modules/example/` (stale references to removed variables)

### Dead Variables to Remove (16)
All `*_pem_path` and `*_key_path` variables (joplin, privatebin, vaultwarden, httpbun_ca, immich, file, caddy, httpbun_nl) — only consumed by commented-out locals.

Also: `pages_domain`, `deno_domain`, `r2_access_key_id`, `r2_access_key` (only in commented-out resources), `cloudflare_user_id`, `cloudflare_email` (unused in config).

### Hardcoded Values to Fix
- IPs in firewall rules (`118.189.189.102`, `195.240.81.42`, `2a06:98c0:3600::103`) -> use `var.sg_ip`, `var.nl_ip`
- Domain in `tunnel_config.tf` line 54: `"draw.erfi.dev"` -> `"draw.${var.secondary_domain_name}"`
- `virtual_network_id` in `lb_pool.tf` -> use resource reference
- Duplicate JA3 hashes in firewall rules

### Variable Description Fix
- `cloudflare_account_id` description says "The zone ID" — should say "The account ID"

### Orphaned Resources
- `cloudflare_load_balancer_monitor.httpbun_arch0` — active but its pool/LB are commented out
- `cloudflare_logpush_ownership_challenge` resources for `spectrum_gcs`/`http_gcs` — logpush jobs are commented out

### Stale Hostname References in Rulesets
Firewall/cache/origin rules reference ~15 hostnames with no active DNS: `port`, `plex`, `git`, `git-ssh`, `home`, `grafana-pie`, `grafana-unraid`, `dillinger`, `hedgedoc`, `photoprism`, `paperless`, `synapse`, `cdn`, `privatebin`, `loader`, `react`, `prometheus-pie`

### Total TLS Overlap
`total_tls.tf` enables Total TLS with Let's Encrypt for primary zone. The new `primary_certificates` module also creates wildcard certs. These overlap — decide whether to rely on Total TLS alone or explicit cert packs.
