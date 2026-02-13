locals {
  # joplin_pem      = replace(file(var.joplin_pem_path), "\n", "\n")
  # joplin_key      = replace(file(var.joplin_key_path), "\n", "\n")
  # privatebin_pem  = replace(file(var.privatebin_pem_path), "\n", "\n")
  # privatebin_key  = replace(file(var.privatebin_key_path), "\n", "\n")
  # vaultwarden_pem = replace(file(var.vaultwarden_pem_path), "\n", "\n")
  # vaultwarden_key = replace(file(var.vaultwarden_key_path), "\n", "\n")
  # immich_pem      = replace(file(var.immich_pem_path), "\n", "\n")
  # immich_key      = replace(file(var.immich_key_path), "\n", "\n")
  # file_pem        = replace(file(var.file_pem_path), "\n", "\n")
  # file_key        = replace(file(var.file_key_path), "\n", "\n")
  # caddy_pem       = replace(file(var.caddy_pem_path), "\n", "\n")
  # caddy_key       = replace(file(var.caddy_key_path), "\n", "\n")
  # httpbun_ca_pem  = replace(file(var.httpbun_ca_pem_path), "\n", "\n")
  # httpbun_ca_key  = replace(file(var.httpbun_ca_key_path), "\n", "\n")
  # httpbun_nl_pem  = replace(file(var.httpbun_nl_pem_path), "\n", "\n")
  # httpbun_nl_key  = replace(file(var.httpbun_nl_key_path), "\n", "\n")

  # Debug: List all rulesets for inspection
  all_rulesets = data.cloudflare_rulesets.managed_waf.rulesets

  # Temporary mapping of all rulesets (we'll refine this after seeing the output)
  ruleset_ids = {
    for rs in data.cloudflare_rulesets.managed_waf.rulesets :
    rs.name => rs.id
  }

  # ---------------------------------------------------------------------------
  # Logpush -> Loki (shared config)
  # ---------------------------------------------------------------------------

  logpush_loki_dest = "https://logpush-k3s.erfi.io/loki/api/v1/raw?header_Content-Type=application%2Fjson&header_X-Logpush-Secret=${var.logpush_secret}"

  zone_ids = {
    erfianugrah_com = var.cloudflare_zone_id
    erfi_dev        = var.secondary_cloudflare_zone_id
    erfi_io         = var.thirdary_cloudflare_zone_id
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

# Output all ruleset information for debugging
# output "available_rulesets" {
#   value = [
#     for rs in local.all_rulesets : {
#       name = rs.name
#       id   = rs.id
#       kind = rs.kind
#     }
#   ]
# }
