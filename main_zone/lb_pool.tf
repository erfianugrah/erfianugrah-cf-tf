resource "cloudflare_load_balancer_pool" "deno" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.ssgs.id
  name            = "Deno"
  origins {
    address = var.deno_domain 
    enabled = true
    header {
      header = "Host"
      values = [var.deno_domain]
    }
    name   = "Deno"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "pages" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.ssgs.id
  name            = "Pages"
  origins {
    address = var.pages_domain 
    enabled = true
    header {
      header = "Host"
      values = ["www.${var.domain_name}"]
    }
    name   = "Pages"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_sg" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_SG"
  origins {
    address = var.sg_ip 
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    name   = "revista_sg"
    weight = 1
  }
}

resource "cloudflare_load_balancer_pool" "revista_nl" {
  account_id      = var.cloudflare_account_id
  check_regions   = ["ALL_REGIONS"]
  enabled         = true
  minimum_origins = 1
  monitor         = cloudflare_load_balancer_monitor.revista.id
  name            = "Revista_NL"
  origins {
    address = var.k3s_tunnel 
    enabled = true
    header {
      header = "Host"
      values = [var.domain_name]
    }
    name   = "revista_nl"
    weight = 1
  }
}
