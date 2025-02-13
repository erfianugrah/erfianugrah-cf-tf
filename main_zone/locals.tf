locals {
  joplin_pem      = replace(file(var.joplin_pem_path), "\n", "\n")
  joplin_key      = replace(file(var.joplin_key_path), "\n", "\n")
  privatebin_pem  = replace(file(var.privatebin_pem_path), "\n", "\n")
  privatebin_key  = replace(file(var.privatebin_key_path), "\n", "\n")
  vaultwarden_pem = replace(file(var.vaultwarden_pem_path), "\n", "\n")
  vaultwarden_key = replace(file(var.vaultwarden_key_path), "\n", "\n")
  immich_pem      = replace(file(var.immich_pem_path), "\n", "\n")
  immich_key      = replace(file(var.immich_key_path), "\n", "\n")
  file_pem        = replace(file(var.file_pem_path), "\n", "\n")
  file_key        = replace(file(var.file_key_path), "\n", "\n")
  caddy_pem       = replace(file(var.caddy_pem_path), "\n", "\n")
  caddy_key       = replace(file(var.caddy_key_path), "\n", "\n")
  httpbun_ca_pem  = replace(file(var.httpbun_ca_pem_path), "\n", "\n")
  httpbun_ca_key  = replace(file(var.httpbun_ca_key_path), "\n", "\n")
  httpbun_nl_pem  = replace(file(var.httpbun_nl_pem_path), "\n", "\n")
  httpbun_nl_key  = replace(file(var.httpbun_nl_key_path), "\n", "\n")

  # Debug: List all rulesets for inspection
  all_rulesets = data.cloudflare_rulesets.managed_waf.rulesets

  # Temporary mapping of all rulesets (we'll refine this after seeing the output)
  ruleset_ids = {
    for rs in data.cloudflare_rulesets.managed_waf.rulesets :
    rs.name => rs.id
  }
}

# Output all ruleset information for debugging
# output "available_rulesets" {
#   value = [
#     for rs in local.all_rulesets : {
#       name = rs.name
#       id   = rs.id
#       kind = rs.kind
#     }
#   ]
# }
