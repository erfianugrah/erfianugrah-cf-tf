
resource "cloudflare_notification_policy" "ddos_l7" {
  account_id  = var.cloudflare_account_id
  name        = "ddos_l7"
  description = "L7 DDoS"
  enabled     = true
  alert_type  = "advanced_ddos_attack_l7_alert"

  email_integration {
    id = var.cloudflare_email
  }

  filters {
    requests_per_second = ["1500"]
    target_hostname     = null
    target_zone_name = [
      "dev.saas.${var.domain_name}",
      "erfianugrah.best",
      var.domain_name,
      "erfianugrah.net",
      "erfianugrah.org",
      "erfi.design",
      "erfi.dev",
      "erfi.one",
      "erfiplan.${var.domain_name}",
      "erfi.sg",
      "erfi.tech",
      "freeplan.${var.domain_name}",
      "prod.saas.${var.domain_name}",
      "stoicopa.io"
    ]
  }
}

resource "cloudflare_notification_policy" "incident_alert_all" {
  account_id  = var.cloudflare_account_id
  name        = "Cloudflare Status"
  description = "Cloudflare Incidents"
  enabled     = true
  alert_type  = "incident_alert"

  email_integration {
    id = var.cloudflare_email
  }
  filters {
    incident_impact = ["INCIDENT_IMPACT_MAJOR", "INCIDENT_IMPACT_CRITICAL"]
  }
}

resource "cloudflare_notification_policy" "adv_waf_alert" {
  account_id  = var.cloudflare_account_id
  name        = "adv_waf_alert"
  description = "WAF Alerts/Anomalies"
  enabled     = true
  alert_type  = "clickhouse_alert_fw_ent_anomaly"

  email_integration {
    id = var.cloudflare_email
  }
  filters {
    zones = [
      "423ae0c9e759d3098c3f8adc1db97c54",
      "3f2c4daa43d5920f313654a873b31d06",
      "a2bf01303a0a6263c833237cbb303e89",
      "95f1d69153e95f65f25fb937d45df1ee",
      "deef4e2fc455b76cf6a05e89f05daf95",
      "d6260a9cd0c27db1e9c0a453b2e4761e",
      "3ef2c7ca1295012e94b5dae237e97737",
      "832e464693e6ad53109bfb988e0ad1d1",
      "c128f8fa9d336a896cf81f47ec12cd24",
      "cf931b6f843bfcf978a920e77718c05c",
      "a5002a23b5f010325412e573d0008515",
      "c4cfc43dcc3613031efae28737b872f2"
    ]
    services = [
      "country",
      "waf",
      "firewallrules",
      "ratelimit",
      "securitylevel",
      "ip",
      "validation",
      "bic",
      "hot",
      "uablock",
      "zonelockdown",
      "iprange",
      "asn",
      "firewallCustom",
      "firewallManaged",
      "dlp"
    ]
    actions = [
      "block",
      "challenge",
      "jsChallenge",
      "connectionClose",
      "managedChallenge",
      "forceConnectionClose"
    ]
  }
}
