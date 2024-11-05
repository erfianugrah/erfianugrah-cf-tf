resource "cloudflare_pages_project" "revista_3" {
  account_id        = var.cloudflare_account_id
  name              = "revista-3"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "erfianugrah"
      repo_name                     = "revista-3"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["*"]
      preview_branch_excludes       = []
    }
  }

  build_config {
    build_command       = "bun run build"
    destination_dir     = "dist"
    build_caching       = true
    root_dir            = ""
    web_analytics_tag   = cloudflare_web_analytics_site.pages_revista3.site_tag
    web_analytics_token = cloudflare_web_analytics_site.pages_revista3.site_token
  }

  deployment_configs {
    preview {
      compatibility_date                   = "2023-11-13"
      compatibility_flags                  = []
      always_use_latest_compatibility_date = false
      fail_open                            = true
      environment_variables = {
        BUN_VERSION = "1.1.34"
      }
    }
    production {
      fail_open                            = true
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2023-11-13"
      usage_model                          = "standard"
      environment_variables = {
        BUN_VERSION = "1.1.34"
      }
    }
  }
}

resource "cloudflare_pages_project" "revista_4" {
  account_id        = var.cloudflare_account_id
  name              = "revista-4"
  production_branch = "main"

  build_config {
    build_command       = "bun run build"
    destination_dir     = "dist"
    build_caching       = true
    root_dir            = ""
    web_analytics_tag   = cloudflare_web_analytics_site.pages_revista4.site_tag
    web_analytics_token = cloudflare_web_analytics_site.pages_revista4.site_token
  }

  deployment_configs {
    preview {
      compatibility_date                   = "2024-01-04"
      compatibility_flags                  = []
      always_use_latest_compatibility_date = false
      fail_open                            = true
      environment_variables = {
        BUN_VERSION = "1.1.34"
      }
    }
    production {
      environment_variables = {
        BUN_VERSION = "1.1.34"
      }
      fail_open                            = true
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2023-11-13"
      usage_model                          = "standard"
    }
  }
}

resource "cloudflare_pages_project" "agerng" {
  account_id        = var.cloudflare_account_id
  name              = "agerng"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "erfianugrah"
      repo_name                     = "agerng"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["*"]
      preview_branch_excludes       = []
    }
  }

  build_config {
    destination_dir     = "dist"
    build_caching       = true
    root_dir            = ""
    web_analytics_tag   = cloudflare_web_analytics_site.pages_agerng.site_tag
    web_analytics_token = cloudflare_web_analytics_site.pages_agerng.site_token
  }

  deployment_configs {
    preview {
      compatibility_date                   = "2024-08-18"
      compatibility_flags                  = []
      always_use_latest_compatibility_date = false
      fail_open                            = true
    }
    production {
      fail_open                            = true
      always_use_latest_compatibility_date = false
      compatibility_date                   = "2024-08-18"
      usage_model                          = "standard"
    }
  }
}
