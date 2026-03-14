# =============================================================================
# Logpush -> Loki (via Alloy on k3s cluster)
# =============================================================================
#
# Each job pushes NDJSON to https://logpush-k3s.erfi.io/loki/api/v1/raw
# The record_prefix injects a "_dataset" field so Alloy can label by dataset.
# Full JSON is stored in Loki; use `| json` in LogQL for query-time parsing.
#
# Locals for the shared destination + field lists to avoid repetition.
# =============================================================================

# -----------------------------------------------------------------------------
# HTTP requests -> Loki (zone-scoped, one per zone)
# -----------------------------------------------------------------------------

resource "cloudflare_logpush_job" "http_loki" {
  for_each = local.zone_ids

  dataset                     = "http_requests"
  destination_conf            = local.logpush_loki_dest
  enabled                     = true
  max_upload_interval_seconds = 30

  output_options {
    output_type      = "ndjson"
    record_prefix    = "{\"_dataset\":\"http_requests\","
    field_names      = local.http_requests_fields
    timestamp_format = "rfc3339"
    cve20214428      = false
  }

  zone_id = each.value
}

# -----------------------------------------------------------------------------
# Firewall events -> Loki (zone-scoped, one per zone)
# -----------------------------------------------------------------------------

resource "cloudflare_logpush_job" "firewall_loki" {
  for_each = local.zone_ids

  dataset                     = "firewall_events"
  destination_conf            = local.logpush_loki_dest
  enabled                     = true
  max_upload_interval_seconds = 30

  output_options {
    output_type      = "ndjson"
    record_prefix    = "{\"_dataset\":\"firewall_events\","
    field_names      = local.firewall_events_fields
    timestamp_format = "rfc3339"
    cve20214428      = false
  }

  zone_id = each.value
}

# -----------------------------------------------------------------------------
# Workers trace events -> Loki (account-scoped, single job)
# -----------------------------------------------------------------------------

resource "cloudflare_logpush_job" "workers_loki" {
  dataset                     = "workers_trace_events"
  destination_conf            = local.logpush_loki_dest
  enabled                     = true
  max_upload_interval_seconds = 30

  output_options {
    output_type      = "ndjson"
    record_prefix    = "{\"_dataset\":\"workers_trace_events\","
    field_names      = local.workers_trace_events_fields
    timestamp_format = "rfc3339"
    cve20214428      = false
  }

  account_id = var.cloudflare_account_id
}
