resource "cloudflare_snippet" "snippets-video-transformation" {
  zone_id     = cloudflare_zone.erfianugrah.id
  name        = "videos"
  main_module = "index"
  files {
    name    = "index"
    content = file("./snippets/media.js")
  }
}

resource "cloudflare_snippet_rules" "snippets-video-transformation-rule" {
  zone_id = cloudflare_zone.erfianugrah.id

  rules {
    snippet_name = cloudflare_snippet.snippets-video-transformation.name
    expression   = "http.request.uri.path matches \"^/pvid/.*$\""
    description  = "Video Transformation"
    enabled      = true
  }
}
