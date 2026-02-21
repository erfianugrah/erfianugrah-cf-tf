#!/bin/bash
# State migration script: consolidate 7 primary zone DNS modules into primary_dns
# Run this BEFORE terraform plan/apply to avoid destroy/recreate of all records
#
# Each command moves a record from its old module location to the new consolidated one.
# The record keys are preserved exactly as they were.

set -euo pipefail

echo "=== Migrating DNS state: 7 modules -> primary_dns ==="

# ── KVM Infrastructure ──────────────────────────────────────────────
echo "Moving kvm_dns records..."
terraform state mv 'module.kvm_dns.cloudflare_record.simple["kvm"]' 'module.primary_dns.cloudflare_record.simple["kvm"]'
terraform state mv 'module.kvm_dns.cloudflare_record.simple["kvm_nl"]' 'module.primary_dns.cloudflare_record.simple["kvm_nl"]'
terraform state mv 'module.kvm_dns.cloudflare_record.simple["ssh_pikvm_sg"]' 'module.primary_dns.cloudflare_record.simple["ssh_pikvm_sg"]'
terraform state mv 'module.kvm_dns.cloudflare_record.simple["ssh_pikvm_nl"]' 'module.primary_dns.cloudflare_record.simple["ssh_pikvm_nl"]'

# ── VyOS Netherlands ────────────────────────────────────────────────
echo "Moving vyos_nl_dns records..."
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["vyos_node_exporter"]' 'module.primary_dns.cloudflare_record.simple["vyos_node_exporter"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["vyos_ssh_nl"]' 'module.primary_dns.cloudflare_record.simple["vyos_ssh_nl"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["coredns_prom_exporter_nl"]' 'module.primary_dns.cloudflare_record.simple["coredns_prom_exporter_nl"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["httpbun_nl"]' 'module.primary_dns.cloudflare_record.simple["httpbun_nl"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["pihole_vyos_nl"]' 'module.primary_dns.cloudflare_record.simple["pihole_vyos_nl"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["tpi"]' 'module.primary_dns.cloudflare_record.simple["tpi"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["prom_tunnel_nl"]' 'module.primary_dns.cloudflare_record.simple["prom_tunnel_nl"]'
terraform state mv 'module.vyos_nl_dns.cloudflare_record.simple["prom_vyos_nl"]' 'module.primary_dns.cloudflare_record.simple["prom_vyos_nl"]'

# ── VyOS Singapore ──────────────────────────────────────────────────
echo "Moving vyos_sg_dns records..."
terraform state mv 'module.vyos_sg_dns.cloudflare_record.simple["vyos_sg_ssh"]' 'module.primary_dns.cloudflare_record.simple["vyos_sg_ssh"]'
terraform state mv 'module.vyos_sg_dns.cloudflare_record.simple["coredns_prom_exporter_sg"]' 'module.primary_dns.cloudflare_record.simple["coredns_prom_exporter_sg"]'
terraform state mv 'module.vyos_sg_dns.cloudflare_record.simple["pihole_vyos_sg"]' 'module.primary_dns.cloudflare_record.simple["pihole_vyos_sg"]'
terraform state mv 'module.vyos_sg_dns.cloudflare_record.simple["ping"]' 'module.primary_dns.cloudflare_record.simple["ping"]'

# ── Authentication ──────────────────────────────────────────────────
echo "Moving auth_dns records..."
terraform state mv 'module.auth_dns.cloudflare_record.simple["keycloak"]' 'module.primary_dns.cloudflare_record.simple["keycloak"]'

# ── Email ───────────────────────────────────────────────────────────
echo "Moving email_dns records..."
terraform state mv 'module.email_dns.cloudflare_record.simple["google_workspace"]' 'module.primary_dns.cloudflare_record.simple["google_workspace"]'
terraform state mv 'module.email_dns.cloudflare_record.simple["spf"]' 'module.primary_dns.cloudflare_record.simple["spf"]'
terraform state mv 'module.email_dns.cloudflare_record.simple["_dmarc"]' 'module.primary_dns.cloudflare_record.simple["_dmarc"]'
terraform state mv 'module.email_dns.cloudflare_record.simple["google_txt"]' 'module.primary_dns.cloudflare_record.simple["google_txt"]'

# ── Storage ─────────────────────────────────────────────────────────
echo "Moving storage_dns records..."
terraform state mv 'module.storage_dns.cloudflare_record.simple["r2"]' 'module.primary_dns.cloudflare_record.simple["r2"]'
terraform state mv 'module.storage_dns.cloudflare_record.simple["gcs"]' 'module.primary_dns.cloudflare_record.simple["gcs"]'
terraform state mv 'module.storage_dns.cloudflare_record.simple["gcs_fetch_test"]' 'module.primary_dns.cloudflare_record.simple["gcs_fetch_test"]'

# ── Special Purpose ─────────────────────────────────────────────────
echo "Moving special_dns records..."
terraform state mv 'module.special_dns.cloudflare_record.simple["atuin"]' 'module.primary_dns.cloudflare_record.simple["atuin"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["discord"]' 'module.primary_dns.cloudflare_record.simple["discord"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["erfipie"]' 'module.primary_dns.cloudflare_record.simple["erfipie"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["k3s_tunnel"]' 'module.primary_dns.cloudflare_record.simple["k3s_tunnel"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["prom_exporter_pi"]' 'module.primary_dns.cloudflare_record.simple["prom_exporter_pi"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["tunnel"]' 'module.primary_dns.cloudflare_record.simple["tunnel"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["whatami"]' 'module.primary_dns.cloudflare_record.simple["whatami"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["challenge"]' 'module.primary_dns.cloudflare_record.simple["challenge"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["httpbun"]' 'module.primary_dns.cloudflare_record.simple["httpbun"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["best_delegation_1"]' 'module.primary_dns.cloudflare_record.simple["best_delegation_1"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["best_delegation_2"]' 'module.primary_dns.cloudflare_record.simple["best_delegation_2"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["dev_saas_delegation_1"]' 'module.primary_dns.cloudflare_record.simple["dev_saas_delegation_1"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["dev_saas_delegation_2"]' 'module.primary_dns.cloudflare_record.simple["dev_saas_delegation_2"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["erfiplan_delegation_1"]' 'module.primary_dns.cloudflare_record.simple["erfiplan_delegation_1"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["erfiplan_delegation_2"]' 'module.primary_dns.cloudflare_record.simple["erfiplan_delegation_2"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["freeplan_delegation_1"]' 'module.primary_dns.cloudflare_record.simple["freeplan_delegation_1"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["freeplan_delegation_2"]' 'module.primary_dns.cloudflare_record.simple["freeplan_delegation_2"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["prod_saas_delegation_1"]' 'module.primary_dns.cloudflare_record.simple["prod_saas_delegation_1"]'
terraform state mv 'module.special_dns.cloudflare_record.simple["prod_saas_delegation_2"]' 'module.primary_dns.cloudflare_record.simple["prod_saas_delegation_2"]'

echo ""
echo "=== Migration complete ==="
echo "Run 'terraform plan' to verify no changes are needed."
echo "The authelia record in media_dns will show as a new addition (it was previously lost due to duplicate key bug)."
