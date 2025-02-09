resource "cloudflare_custom_hostname" "dev_saas" {
  hostname = "dev.saas.${var.domain_name}"
  zone_id  = var.cloudflare_zone_id
  ssl {
    bundle_method         = "ubiquitous"
    certificate_authority = "lets_encrypt"
    method                = "http"
    settings {
      min_tls_version = "1.0"
    }
    type     = "dv"
    wildcard = false
  }
}

resource "cloudflare_custom_hostname" "coffee_test" {
  custom_origin_server = "coffee.test.${var.domain_name}"
  custom_origin_sni    = ":request_host_header:"
  hostname             = "test2.erfi.me"
  zone_id              = var.cloudflare_zone_id
  ssl {
    bundle_method         = "ubiquitous"
    certificate_authority = "lets_encrypt"
    method                = "txt"
    settings {
      min_tls_version = "1.0"
    }
    type     = "dv"
    wildcard = true
  }
}

resource "cloudflare_custom_hostname" "erfi_me" {
  custom_origin_server = "2534f85b-3208-4de9-9221-4c2cf44545f3.cfargotunnel.com"
  custom_origin_sni    = ":request_host_header:"
  hostname             = "test3.erfi.me"
  zone_id              = var.cloudflare_zone_id
  ssl {
    bundle_method         = "ubiquitous"
    certificate_authority = "lets_encrypt"
    method                = "txt"
    settings {
      min_tls_version = "1.0"
    }
    type     = "dv"
    wildcard = true
  }
}