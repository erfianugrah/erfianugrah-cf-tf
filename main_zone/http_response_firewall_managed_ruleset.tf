resource "cloudflare_ruleset" "http_response_firewall_managed" {
  kind    = "zone"
  name    = "default"
  phase   = "http_response_firewall_managed"
  zone_id = var.cloudflare_zone_id
  rules {
    action = "execute"
    action_parameters {
      id = "e22d83c647c64a3eae91b71b499d988e"
      overrides {
        rules {
          enabled = true
          id      = "9edd266643614625b49473adbcaa85dd"
        }
        rules {
          enabled = true
          id      = "cb5b6ab60e93455eac781095572add47"
        }
        rules {
          enabled = true
          id      = "ee99eee68af9468bacde33a1d1df2ff7"
        }
        rules {
          enabled = true
          id      = "95024a9deeae419bb8fe301983fd8cda"
        }
        rules {
          enabled = true
          id      = "179385d1150e41a2bd31c37c4501643d"
        }
        rules {
          enabled = true
          id      = "4cb965c1f43d4a1e980102c2d5c8dc1e"
        }
        rules {
          enabled = true
          id      = "6cde62ca0929403aa7195d9b01ceb1a5"
        }
        rules {
          enabled = true
          id      = "5fbc0a9f5ca445b9b1f121316aadfa92"
        }
        rules {
          enabled = true
          id      = "09c819de13144a9e81e46e2f64f3fd0a"
        }
        rules {
          enabled = true
          id      = "5da2f6dc01484df79fc9dcdef6949ce5"
        }
        rules {
          enabled = true
          id      = "d1f1a1d860794cb4b5fa43439e299f80"
        }
        rules {
          enabled = true
          id      = "dfd6af0a973a47618a7b0e8d6dbbcb1d"
        }
        rules {
          enabled = true
          id      = "b57375c3992b4fc7a65d7a8316f07f77"
        }
        rules {
          enabled = true
          id      = "508bb1d52bc24cf8817845b7c78cf1e1"
        }
        rules {
          enabled = true
          id      = "2879e87f35c3497da70cef080f8f2657"
        }
        rules {
          enabled = true
          id      = "90114d33e1754d41822c05001de9d208"
        }
        rules {
          enabled = true
          id      = "398fb15f86384cfdb29d55ff5fe4101e"
        }
        rules {
          enabled = true
          id      = "44a6edc1cd5d4f91983f8f7ee8f88e5e"
        }
        rules {
          enabled = true
          id      = "26e114ddd1a74e158f831e5a0f07327b"
        }
        rules {
          enabled = true
          id      = "a1c39ba8e2a04024a0c7f0b5a44de9b0"
        }
        rules {
          enabled = true
          id      = "5b26fc5be5214b9ea43631032f6b5d4f"
        }
        rules {
          enabled = true
          id      = "ebfad12cd46f4788bc4053d8b5d78eea"
        }
        rules {
          enabled = true
          id      = "1267f15736184403bc060c0b1d83f33f"
        }
        rules {
          enabled = true
          id      = "f53e56714f824ad6997377039d4175f3"
        }
        rules {
          enabled = true
          id      = "3467703450cc49c1ad849835a4b22ed8"
        }
        rules {
          enabled = true
          id      = "040ba0caa1df4cefab8a154e94cc67b7"
        }
        rules {
          enabled = true
          id      = "5042793295d74bb2806729daa82297b2"
        }
        rules {
          enabled = true
          id      = "cd5c40bc08ce4185bfc52b861d835e5d"
        }
        rules {
          enabled = true
          id      = "3e82773a73ad4a3ab281e13f3d0f5fb9"
        }
        rules {
          enabled = true
          id      = "27bec7a1c05d413480fbd9a45e36a715"
        }
      }
      version = "latest"
    }
    enabled    = true
    expression = "true"
  }
}