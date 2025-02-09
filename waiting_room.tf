resource "cloudflare_waiting_room" "funfair" {
  zone_id              = var.cloudflare_zone_id
  name                 = "funfair"
  host                 = "funfair.${var.domain_name}"
  path                 = "/"
  new_users_per_minute = 200
  total_active_users   = 200
  cookie_suffix        = "queue1"

  queueing_status_code = 200
}
