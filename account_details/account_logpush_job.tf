resource "cloudflare_logpush_job" "audit-logs" {
  dataset          = "audit_logs"
  enabled          = true
  account_id       = var.cloudflare_account_id
  name             = "audit-logs"
  logpull_options  = "fields=ActionResult,ActionType,ActorEmail,ActorID,ActorIP,ActorType,ID,Interface,Metadata,NewValue,OldValue,OwnerID,ResourceID,ResourceType,When&timestamps=rfc3339"
  destination_conf = "r2://audit-logs/audit-logs/date={DATE}?access-key-id=${var.r2_access_key_id}&secret-access-key=${var.r2_access_key}&account-id=${var.cloudflare_account_id}"
}
