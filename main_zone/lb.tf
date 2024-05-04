resource "cloudflare_load_balancer" "pages_deno" {
  default_pool_ids = [cloudflare_load_balancer_pool.deno.id]
  enabled          = true
  fallback_pool_id = cloudflare_load_balancer_pool.pages.id
  name             = "www.${var.domain_name}"
  proxied          = true
  session_affinity = "none"
  steering_policy  = "off"
  zone_id          = var.cloudflare_zone_id
  adaptive_routing {
    failover_across_pools = true
  }
  location_strategy {
    mode       = "pop"
    prefer_ecs = "proximity"
  }
  random_steering {
    default_weight = 1
  }
  session_affinity_attributes {
    samesite               = "Auto"
    secure                 = "Auto"
    zero_downtime_failover = "temporary"
  }
}

resource "cloudflare_load_balancer" "revista" {
  default_pool_ids = [cloudflare_load_balancer_pool.revista_nl.id]
  enabled          = true
  fallback_pool_id = cloudflare_load_balancer_pool.revista_sg.id
  name             = var.domain_name
  proxied          = true
  session_affinity = "none"
  steering_policy  = "geo"
  zone_id          = var.cloudflare_zone_id
  pop_pools {
    pop      = "AMS"
    pool_ids = [cloudflare_load_balancer_pool.revista_nl.id]
  }
  pop_pools {
    pop      = "SIN"
    pool_ids = [cloudflare_load_balancer_pool.revista_sg.id]
  }
  adaptive_routing {
    failover_across_pools = true
  }
  location_strategy {
    mode       = "pop"
    prefer_ecs = "proximity"
  }
  random_steering {
    default_weight = 1
  }
  session_affinity_attributes {
    samesite               = "Auto"
    secure                 = "Auto"
    zero_downtime_failover = "temporary"
  }
}
