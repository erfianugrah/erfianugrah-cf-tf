# Enable security headers using Managed Meaders
resource "cloudflare_managed_headers" "managed_headers" {
  zone_id = var.cloudflare_zone_id

  managed_request_headers {
    id      = "add_bot_protection_headers"
    enabled = true
  }

  managed_request_headers {
    id      = "add_client_certificate_headers"
    enabled = true
  }

  managed_request_headers {
    id      = "add_visitor_location_headers"
    enabled = true
  }

  managed_response_headers {
    id      = "remove_x-powered-by_header"
    enabled = true
  }

  managed_response_headers {
    id      = "add_security_headers"
    enabled = true
  }
}