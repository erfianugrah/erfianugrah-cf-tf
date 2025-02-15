resource "cloudflare_zero_trust_key_access_key_configuration" "erfi_corp_access_key" {
  account_id                 = var.cloudflare_account_id
  key_rotation_interval_days = 365
}
