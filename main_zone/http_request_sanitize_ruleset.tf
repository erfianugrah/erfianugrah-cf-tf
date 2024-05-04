resource "cloudflare_ruleset" "http_request_sanitize" {
  description = "ruleset for controlling url normalization"
  kind        = "zone"
  name        = "Entrypoint for url normalization ruleset"
  phase       = "http_request_sanitize"
  zone_id     = var.cloudflare_zone_id
  rules {
    action = "execute"
    action_parameters {
      id = "70339d97bdb34195bbf054b1ebe81f76"
      overrides {
        rules {
          enabled = false
          id      = "78723a9e0c7c4c6dbec5684cb766231d"
        }
        rules {
          enabled = false
          id      = "b232b534beea4e00a21dcbb7a8a545e9"
        }
        rules {
          enabled = true
          id      = "20e18610e4a048d6b87430b3cb2d89a3"
        }
        rules {
          enabled = false
          id      = "60444c0705d4438799584a15cca2cb7d"
        }
      }
      version = "latest"
    }
    enabled    = true
    expression = "true"
  }
}