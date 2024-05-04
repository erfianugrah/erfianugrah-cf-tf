resource "cloudflare_logpush_ownership_challenge" "spectrum_gcs" {
  zone_id          = var.cloudflare_zone_id
  destination_conf = "gs://erfi-logs/http"
}