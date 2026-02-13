# resource "cloudflare_load_balancer" "pages_deno" {
#   default_pool_ids = [cloudflare_load_balancer_pool.pages.id]
#   enabled          = true
#   fallback_pool_id = cloudflare_load_balancer_pool.deno.id
#   name             = "www.${var.domain_name}"
#   proxied          = true
#   session_affinity = "none"
#   steering_policy  = "off"
#   zone_id          = var.cloudflare_zone_id
#   adaptive_routing {
#     failover_across_pools = true
#   }
#   location_strategy {
#     mode       = "pop"
#     prefer_ecs = "proximity"
#   }
#   random_steering {
#     default_weight = 1
#   }
#   session_affinity_attributes {
#     samesite               = "Auto"
#     secure                 = "Auto"
#     zero_downtime_failover = "temporary"
#   }
# }

# resource "cloudflare_load_balancer" "revista" {
#   default_pool_ids = [cloudflare_load_balancer_pool.revista_k3s_nl.id, cloudflare_load_balancer_pool.revista_proxmox_nl.id, cloudflare_load_balancer_pool.revista_ipsec_k3s_nl.id]
#   enabled          = true
#   fallback_pool_id = cloudflare_load_balancer_pool.revista_sg.id
#   name             = var.domain_name
#   proxied          = true
#   session_affinity = "none"
#   steering_policy  = "geo"
#   zone_id          = var.cloudflare_zone_id
#   pop_pools {
#     pop      = "AMS"
#     pool_ids = [cloudflare_load_balancer_pool.revista_k3s_nl.id, cloudflare_load_balancer_pool.revista_proxmox_nl.id, cloudflare_load_balancer_pool.revista_ipsec_k3s_nl.id]
#   }
#   pop_pools {
#     pop      = "SIN"
#     pool_ids = [cloudflare_load_balancer_pool.revista_sg.id]
#   }
#   adaptive_routing {
#     failover_across_pools = true
#   }
#   location_strategy {
#     mode       = "pop"
#     prefer_ecs = "proximity"
#   }
#   random_steering {
#     default_weight = 1
#   }
#   session_affinity_attributes {
#     samesite               = "Auto"
#     secure                 = "Auto"
#     zero_downtime_failover = "temporary"
#   }
# }

# resource "cloudflare_load_balancer" "authentik" {
#   enabled          = true
#   proxied          = true
#   zone_id          = var.thirdary_cloudflare_zone_id
#   default_pool_ids = [cloudflare_load_balancer_pool.authentik_ipsec_k3s_nl.id]
#   fallback_pool_id = cloudflare_load_balancer_pool.authentik_ipsec_k3s_nl.id
#   name             = "authentik.${var.thirdary_domain_name}"
#   session_affinity = "none"
#   steering_policy  = "dynamic_latency"
#   # pop_pools {
#   #   pop      = "AMS"
#   #   pool_ids = [cloudflare_load_balancer_pool.authentik_ipsec_k3s_nl.id]
#   # }
#   adaptive_routing {
#     failover_across_pools = true
#   }
#   location_strategy {
#     mode       = "pop"
#     prefer_ecs = "proximity"
#   }
#   random_steering {
#     default_weight = 1
#   }
#   session_affinity_attributes {
#     samesite               = "Auto"
#     secure                 = "Auto"
#     zero_downtime_failover = "temporary"
#   }
# }

resource "cloudflare_load_balancer" "httpbun_ipsec_erfipie" {
  default_pool_ids = [cloudflare_load_balancer_pool.httpbun_ipsec_erfipie_nl.id]
  enabled          = true
  fallback_pool_id = cloudflare_load_balancer_pool.httpbun_ipsec_erfipie_nl.id
  name             = "httpbun-pie.${var.thirdary_domain_name}"
  proxied          = true
  session_affinity = "none"
  steering_policy  = "geo"
  zone_id          = var.thirdary_cloudflare_zone_id
  pop_pools {
    pop      = "AMS"
    pool_ids = [cloudflare_load_balancer_pool.httpbun_ipsec_erfipie_nl.id]
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

resource "cloudflare_load_balancer" "jitsi" {
  enabled          = true
  proxied          = true
  zone_id          = var.thirdary_cloudflare_zone_id
  default_pool_ids = [cloudflare_load_balancer_pool.jitsi_ipsec_k3s_nl.id]
  fallback_pool_id = cloudflare_load_balancer_pool.jitsi_ipsec_k3s_nl.id
  name             = "jitsi-lb.${var.thirdary_domain_name}"
  session_affinity = "none"
  steering_policy  = "dynamic_latency"
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

# resource "cloudflare_load_balancer" "httpbun_ipsec_arch0" {
#   default_pool_ids = [cloudflare_load_balancer_pool.httpbun_ipsec_arch0_nl.id]
#   enabled          = true
#   fallback_pool_id = cloudflare_load_balancer_pool.httpbun_ipsec_arch0_nl.id
#   name             = "httpbun-arch0.${var.domain_name}"
#   proxied          = true
#   session_affinity = "none"
#   steering_policy  = "geo"
#   zone_id          = var.cloudflare_zone_id
#   pop_pools {
#     pop      = "AMS"
#     pool_ids = [cloudflare_load_balancer_pool.httpbun_ipsec_arch0_nl.id]
#   }
#   adaptive_routing {
#     failover_across_pools = true
#   }
#   location_strategy {
#     mode       = "pop"
#     prefer_ecs = "proximity"
#   }
#   random_steering {
#     default_weight = 1
#   }
#   session_affinity_attributes {
#     samesite               = "Auto"
#     secure                 = "Auto"
#     zero_downtime_failover = "temporary"
#   }
# }
