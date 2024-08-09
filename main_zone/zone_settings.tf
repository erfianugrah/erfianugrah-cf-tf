resource "cloudflare_zone_settings_override" "erfi_zone_settings" {
  zone_id = var.cloudflare_zone_id
  settings {
    always_online            = "off"
    always_use_https         = "off"
    automatic_https_rewrites = "off"
    brotli                   = "on"
    browser_cache_ttl        = 0
    browser_check            = "off"
    cache_level              = "aggressive"
    challenge_ttl            = 300
    ciphers                  = ["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-CHACHA20-POLY1305", "ECDHE-ECDSA-AES256-GCM-SHA384", "ECDHE-RSA-AES128-GCM-SHA256", "ECDHE-RSA-CHACHA20-POLY1305", "ECDHE-RSA-AES256-GCM-SHA384"]
    cname_flattening         = "flatten_at_root"
    development_mode         = "off"
    early_hints              = "off"
    email_obfuscation        = "off"
    # filter_logs_to_cloudflare = "off"
    hotlink_protection = "off"
    http2              = "on"
    http3              = "on"
    ip_geolocation     = "on"
    ipv6               = "off"
    # log_to_cloudflare         = "on"
    # max_upload                = 99999
    min_tls_version = "1.2"
    # minify {
    #   css  = "off"
    #   html = "off"
    #   js   = "off"
    # }
    mirage                      = "off"
    opportunistic_encryption    = "on"
    opportunistic_onion         = "on"
    orange_to_orange            = "on"
    origin_error_page_pass_thru = "on"
    polish                      = "lossless"
    prefetch_preload            = "off"
    privacy_pass                = "on"
    proxy_read_timeout          = "6000"
    pseudo_ipv4                 = "off"
    response_buffering          = "off"
    rocket_loader               = "on"
    security_header {
      enabled            = true
      include_subdomains = true
      max_age            = 31536000
      nosniff            = true
      preload            = true
    }
    security_level              = "high"
    server_side_exclude         = "off"
    sort_query_string_for_cache = "off"
    ssl                         = "origin_pull"
    tls_1_3                     = "zrt"
    tls_client_auth             = "off"
    true_client_ip_header       = "on"
    # visitor_ip                  = "on"
    waf        = "off"
    webp       = "on"
    websockets = "on"
    zero_rtt   = "on"
  }
}

