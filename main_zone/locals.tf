locals {
  # WAF ruleset name => ID lookup (used by http_request_firewall_managed_ruleset.tf)
  ruleset_ids = {
    for rs in data.cloudflare_rulesets.managed_waf.rulesets :
    rs.name => rs.id
  }

  # ---------------------------------------------------------------------------
  # Logpush -> Loki (shared config)
  # ---------------------------------------------------------------------------

  logpush_loki_dest = "https://logpush-k3s.erfi.io/loki/api/v1/raw?header_Content-Type=application%2Fjson&header_X-Logpush-Secret=${var.logpush_secret}"

  # Canonical zone map — use local.zones.primary.domain etc. throughout
  zones = {
    primary   = { zone_id = var.cloudflare_zone_id, domain = var.domain_name }
    secondary = { zone_id = var.secondary_cloudflare_zone_id, domain = var.secondary_domain_name }
    tertiary  = { zone_id = var.tertiary_cloudflare_zone_id, domain = var.tertiary_domain_name }
  }

  # Legacy map kept for logpush iteration (uses zone_id values only)
  zone_ids = {
    erfianugrah_com = local.zones.primary.zone_id
    erfi_dev        = local.zones.secondary.zone_id
    erfi_io         = local.zones.tertiary.zone_id
  }

  # http_requests: all fields from CF docs (deprecated fields excluded)
  http_requests_fields = [
    "BotDetectionIDs", "BotDetectionTags", "BotScore", "BotScoreSrc", "BotTags",
    "CacheCacheStatus", "CacheReserveUsed", "CacheResponseBytes", "CacheTieredFill",
    "ClientASN", "ClientCity", "ClientCountry", "ClientDeviceType", "ClientIP",
    "ClientIPClass", "ClientLatitude", "ClientLongitude", "ClientMTLSAuthCertFingerprint",
    "ClientMTLSAuthStatus", "ClientRegionCode", "ClientRequestBytes", "ClientRequestHost",
    "ClientRequestMethod", "ClientRequestPath", "ClientRequestProtocol", "ClientRequestReferer",
    "ClientRequestScheme", "ClientRequestSource", "ClientRequestURI", "ClientRequestUserAgent",
    "ClientSSLCipher", "ClientSSLProtocol", "ClientSrcPort", "ClientTCPRTTMs",
    "ClientXRequestedWith", "ContentScanObjResults", "ContentScanObjSizes", "ContentScanObjTypes",
    "Cookies", "EdgeCFConnectingO2O", "EdgeColoCode", "EdgeColoID", "EdgeEndTimestamp",
    "EdgePathingOp", "EdgePathingSrc", "EdgePathingStatus", "EdgeRequestHost",
    "EdgeResponseBodyBytes", "EdgeResponseBytes", "EdgeResponseCompressionRatio",
    "EdgeResponseContentType", "EdgeResponseStatus", "EdgeServerIP", "EdgeStartTimestamp",
    "EdgeTimeToFirstByteMs", "FraudAttack", "FraudDetectionIDs", "FraudDetectionTags",
    "JA3Hash", "JA4", "JA4Signals", "JSDetectionPassed", "LeakedCredentialCheckResult",
    "OriginDNSResponseTimeMs", "OriginIP", "OriginRequestHeaderSendDurationMs",
    "OriginResponseDurationMs", "OriginResponseHTTPExpires", "OriginResponseHTTPLastModified",
    "OriginResponseHeaderReceiveDurationMs", "OriginResponseStatus", "OriginSSLProtocol",
    "OriginTCPHandshakeDurationMs", "OriginTLSHandshakeDurationMs", "ParentRayID", "RayID",
    "RequestHeaders", "ResponseHeaders", "SecurityAction", "SecurityActions",
    "SecurityRuleDescription", "SecurityRuleID", "SecurityRuleIDs", "SecuritySources",
    "SmartRouteColoID", "UpperTierColoID", "VerifiedBotCategory",
    "WAFAttackScore", "WAFRCEAttackScore", "WAFSQLiAttackScore", "WAFXSSAttackScore",
    "WorkerCPUTime", "WorkerScriptName", "WorkerStatus", "WorkerSubrequest",
    "WorkerSubrequestCount", "WorkerWallTimeUs", "ZoneName",
  ]

  # firewall_events: all fields from CF docs
  firewall_events_fields = [
    "Action", "ClientASN", "ClientASNDescription", "ClientCountry", "ClientIP",
    "ClientIPClass", "ClientRefererHost", "ClientRefererPath", "ClientRefererQuery",
    "ClientRefererScheme", "ClientRequestHost", "ClientRequestMethod", "ClientRequestPath",
    "ClientRequestProtocol", "ClientRequestQuery", "ClientRequestScheme",
    "ClientRequestUserAgent", "ContentScanObjResults", "ContentScanObjSizes",
    "ContentScanObjTypes", "Datetime", "Description", "EdgeColoCode", "EdgeResponseStatus",
    "Kind", "LeakedCredentialCheckResult", "MatchIndex", "Metadata", "OriginResponseStatus",
    "OriginatorRayID", "RayID", "Ref", "RuleID", "Source",
  ]

  # workers_trace_events: all fields from CF docs
  workers_trace_events_fields = [
    "CPUTimeMs", "DispatchNamespace", "Entrypoint", "Event", "EventTimestampMs",
    "EventType", "Exceptions", "Logs", "Outcome", "ScriptName", "ScriptTags",
    "ScriptVersion", "WallTimeMs",
  ]
}
