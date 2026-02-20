# Removed: logpush ownership challenges for spectrum_gcs and http_gcs
# The logpush jobs that consumed these are commented out in zone_logpush_job.tf
# resource "cloudflare_logpush_ownership_challenge" "spectrum_gcs" {
#   zone_id          = var.cloudflare_zone_id
#   destination_conf = "gs://erfi-logs/spectrum"
# }
#
# resource "cloudflare_logpush_ownership_challenge" "http_gcs" {
#   zone_id          = var.cloudflare_zone_id
#   destination_conf = "gs://erfi-logs/http"
# }
