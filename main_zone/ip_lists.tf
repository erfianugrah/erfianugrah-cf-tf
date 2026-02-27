# List containers (no inline items - managed by cloudflare_list_item to avoid ordering drift)
resource "cloudflare_list" "erfi_ips" {
  account_id = var.cloudflare_account_id
  name       = "erfi_ips"
  kind       = "ip"

  lifecycle {
    ignore_changes = [item]
  }
}

resource "cloudflare_list" "cf_ips" {
  account_id = var.cloudflare_account_id
  name       = "cf_ips"
  kind       = "ip"

  lifecycle {
    ignore_changes = [item]
  }
}

# ── erfi_ips items ────────────────────────────────────────────────────
resource "cloudflare_list_item" "erfi_sg" {
  account_id = var.cloudflare_account_id
  list_id    = cloudflare_list.erfi_ips.id
  ip         = var.sg_ip
  comment    = "sg"
}

resource "cloudflare_list_item" "erfi_nl" {
  account_id = var.cloudflare_account_id
  list_id    = cloudflare_list.erfi_ips.id
  ip         = var.nl_ip
  comment    = "nl"
}

# ── cf_ips items ──────────────────────────────────────────────────────
resource "cloudflare_list_item" "cf_ip" {
  for_each = { for ip in var.cf_ips : replace(replace(ip, "/", "_"), ":", "-") => ip }

  account_id = var.cloudflare_account_id
  list_id    = cloudflare_list.cf_ips.id
  ip         = each.value
}
