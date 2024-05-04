resource "cloudflare_observatory_scheduled_test" "www_europe_west" {
  zone_id = var.cloudflare_zone_id
  url = "www.${var.domain_name}/"
  region = "europe-west1"
  frequency = "DAILY"
}

resource "cloudflare_observatory_scheduled_test" "root_europe_west" {
  zone_id = var.cloudflare_zone_id
  url = "${var.domain_name}/"
  region = "europe-west1"
  frequency = "DAILY"
}

resource "cloudflare_observatory_scheduled_test" "www_asia_southeast1" {
  zone_id = var.cloudflare_zone_id
  url = "www.${var.domain_name}/"
  region = "asia-southeast1"
  frequency = "DAILY"
}

resource "cloudflare_observatory_scheduled_test" "root_asia_southeast1" {
  zone_id = var.cloudflare_zone_id
  url = "${var.domain_name}/"
  region = "asia-southeast1"
  frequency = "DAILY"
}

resource "cloudflare_observatory_scheduled_test" "root_us_east_1" {
  zone_id = var.cloudflare_zone_id
  url = "${var.domain_name}/"
  region = "us-east1"
  frequency = "DAILY"
}

resource "cloudflare_observatory_scheduled_test" "www_us_east_1" {
  zone_id = var.cloudflare_zone_id
  url = "www.${var.domain_name}/"
  region = "us-east1"
  frequency = "DAILY"
}