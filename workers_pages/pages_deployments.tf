resource "cloudflare_pages_project" "revista_3" {
  account_id        = var.cloudflare_account_id
  name              = "revista-3"
  production_branch = "npm"

  source {
    type = "github"
    config {
      owner                         = "erfianugrah"
      repo_name                     = "revista-3"
      production_branch             = "npm"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["*"]
      preview_branch_excludes       = []
    }
  }

  build_config {
    build_command       = "npm run build"
    destination_dir     = "dist"
    build_caching       = true
    root_dir            = ""
    web_analytics_tag   = "1b41d673bc8340fd8894a32823a18449"
    web_analytics_token = "8028d33b9cbc440ba5f3710dfbac184d"
  }

  deployment_configs {
    preview {
      compatibility_date                   = "2023-11-13"
      compatibility_flags                  = []
      always_use_latest_compatibility_date = false
      fail_open                            = true
      environment_variables                = null
    }
    production {
      environment_variables                = null
      fail_open                            = true
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2023-11-13"
      usage_model                          = "standard"
    }
  }
}

resource "cloudflare_pages_project" "revista_4" {
  account_id        = var.cloudflare_account_id
  name              = "revista-4"
  production_branch = "main"

  build_config {
    build_command   = "bun run build"
    destination_dir = "dist"
    build_caching   = true
    root_dir        = ""
  }

  deployment_configs {
    preview {
      compatibility_date                   = "2024-01-04"
      compatibility_flags                  = []
      always_use_latest_compatibility_date = false
      fail_open                            = true
      environment_variables                = null
    }
    production {
      environment_variables                = null
      fail_open                            = true
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2023-11-13"
      usage_model                          = "standard"
    }
  }
}

