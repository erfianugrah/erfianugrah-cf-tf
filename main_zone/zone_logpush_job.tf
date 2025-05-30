resource "cloudflare_logpush_job" "http_r2" {
  dataset                     = "http_requests"
  destination_conf            = "r2://http-logs/{DATE}?access-key-id=${var.r2_access_key_id}&secret-access-key=${var.r2_access_key}&account-id=${var.cloudflare_account_id}"
  enabled                     = true
  max_upload_interval_seconds = "30"

  output_options {
    output_type = "ndjson"
    field_names = [
      "ClientIP", "ClientRequestHost", "ClientRequestMethod", "ClientRequestURI",
      "EdgeEndTimestamp", "EdgeResponseBytes", "EdgeResponseStatus", "EdgeStartTimestamp",
      "RayID", "BotScore", "BotScoreSrc", "BotTags", "CacheCacheStatus",
      "CacheResponseBytes", "CacheResponseStatus", "CacheTieredFill", "ClientASN",
      "ClientCountry", "ClientDeviceType", "ClientIPClass", "ClientMTLSAuthCertFingerprint",
      "ClientMTLSAuthStatus", "ClientRequestBytes", "ClientRequestPath",
      "ClientRequestProtocol", "ClientRequestReferer", "ClientRequestScheme",
      "ClientRequestSource", "ClientRequestUserAgent", "ClientSSLCipher",
      "ClientSSLProtocol", "ClientSrcPort", "ClientTCPRTTMs", "ClientXRequestedWith",
      "Cookies", "EdgeCFConnectingO2O", "EdgeColoCode", "EdgeColoID", "EdgePathingOp",
      "EdgePathingSrc", "EdgePathingStatus", "EdgeRateLimitAction", "EdgeRateLimitID",
      "EdgeRequestHost", "EdgeResponseBodyBytes", "EdgeResponseCompressionRatio",
      "EdgeResponseContentType", "EdgeServerIP", "EdgeTimeToFirstByteMs",
      "FirewallMatchesActions", "FirewallMatchesRuleIDs", "FirewallMatchesSources",
      "JA3Hash", "OriginDNSResponseTimeMs", "OriginIP", "OriginRequestHeaderSendDurationMs",
      "OriginResponseBytes", "OriginResponseDurationMs", "OriginResponseHTTPExpires",
      "OriginResponseHTTPLastModified", "OriginResponseHeaderReceiveDurationMs",
      "OriginResponseStatus", "OriginResponseTime", "OriginSSLProtocol",
      "OriginTCPHandshakeDurationMs", "OriginTLSHandshakeDurationMs", "ParentRayID",
      "RequestHeaders", "ResponseHeaders", "SecurityLevel", "SmartRouteColoID",
      "UpperTierColoID", "WAFAction", "WAFFlags", "WAFMatchedVar", "WAFProfile",
      "WAFRuleID", "WAFRuleMessage", "WorkerCPUTime", "WorkerStatus", "WorkerSubrequest",
      "WorkerSubrequestCount", "ZoneID", "ZoneName", "CacheReserveUsed", "WorkerWallTimeUs",
      "BotDetectionIDs", "ClientRegionCode", "ContentScanObjResults", "ContentScanObjTypes",
      "WAFAttackScore", "WAFRCEAttackScore", "WAFSQLiAttackScore", "WAFXSSAttackScore",
      "SecurityAction", "SecurityActions", "SecurityRuleDescription", "SecurityRuleID",
      "SecurityRuleIDs", "SecuritySources", "Action", "ClientASNDescription",
      "ClientRefererHost", "ClientRefererPath", "ClientRefererQuery", "ClientRefererScheme",
      "ClientRequestQuery", "Datetime", "Description", "Kind", "MatchIndex", "Metadata",
      "OriginatorRayID", "Ref", "RuleID", "Source", "LeakedCredentialCheckResult",
      "BotDetectionTags", "ClientCity", "ClientLatitude", "ClientLongitude",
      "ContentScanObjSizes", "JA4", "JA4Signals", "ParentRayID", "RayID",
      "WorkerScriptName"
    ]
    timestamp_format = "rfc3339"
    cve20214428      = false
  }

  zone_id = var.cloudflare_zone_id
}

# resource "cloudflare_logpush_job" "firewall_gcs" {
#   dataset                     = "firewall_events"
#   destination_conf            = "gs://erfi-logs/firewall/{DATE}"
#   enabled                     = true
#   max_upload_interval_seconds = "30"
#   logpull_options             = "fields=Action,ClientIP,ClientRequestHost,ClientRequestMethod,ClientRequestPath,ClientRequestQuery,Datetime,EdgeResponseStatus,RayID,ClientASN,ClientASNDescription,ClientCountry,ClientIPClass,ClientRefererHost,ClientRefererPath,ClientRefererQuery,ClientRefererScheme,ClientRequestProtocol,ClientRequestScheme,ClientRequestUserAgent,EdgeColoCode,Kind,MatchIndex,Metadata,OriginResponseStatus,OriginatorRayID,RuleID,Source,BotScore,BotScoreSrc,BotTags,CacheCacheStatus,CacheReserveUsed,CacheResponseBytes,CacheResponseStatus,CacheTieredFill,ClientDeviceType,ClientMTLSAuthCertFingerprint,ClientMTLSAuthStatus,ClientRequestBytes,ClientRequestReferer,ClientRequestSource,ClientRequestURI,ClientSSLCipher,ClientSSLProtocol,ClientSrcPort,ClientTCPRTTMs,ClientXRequestedWith,Cookies,EdgeCFConnectingO2O,EdgeColoID,EdgeEndTimestamp,EdgePathingOp,EdgePathingSrc,EdgePathingStatus,EdgeRateLimitAction,EdgeRateLimitID,EdgeRequestHost,EdgeResponseBodyBytes,EdgeResponseBytes,EdgeResponseCompressionRatio,EdgeResponseContentType,EdgeServerIP,EdgeStartTimestamp,EdgeTimeToFirstByteMs,FirewallMatchesActions,FirewallMatchesRuleIDs,FirewallMatchesSources,JA3Hash,OriginDNSResponseTimeMs,OriginIP,OriginRequestHeaderSendDurationMs,OriginResponseBytes,OriginResponseDurationMs,OriginResponseHTTPExpires,OriginResponseHTTPLastModified,OriginResponseHeaderReceiveDurationMs,OriginResponseTime,OriginSSLProtocol,OriginTCPHandshakeDurationMs,OriginTLSHandshakeDurationMs,ParentRayID,RequestHeaders,ResponseHeaders,SecurityLevel,SmartRouteColoID,UpperTierColoID,WAFAction,WAFFlags,WAFMatchedVar,WAFProfile,WAFRuleID,WAFRuleMessage,WorkerCPUTime,WorkerStatus,WorkerSubrequest,WorkerSubrequestCount,WorkerWallTimeUs,ZoneID,ZoneName,Description,Ref,LeakedCredentialCheckResult,ContentScanObjResults,ContentScanObjSizes,ContentScanObjTypes&timestamps=rfc3339&CVE-2021-44228=false"
#   zone_id                     = var.cloudflare_zone_id
# }
#
# resource "cloudflare_logpush_job" "spectrum_gcs" {
#   ownership_challenge         = cloudflare_logpush_ownership_challenge.spectrum_gcs.ownership_challenge_filename
#   dataset                     = "spectrum_events"
#   destination_conf            = "gs://erfi-logs/spectrum"
#   enabled                     = true
#   max_upload_interval_seconds = "30"
#   logpull_options             = "fields=Application,ClientAsn,ClientBytes,ClientCountry,ClientIP,ClientMatchedIpFirewall,ClientPort,ClientProto,ColoCode,ConnectTimestamp,DisconnectTimestamp,Event,OriginBytes,OriginIP,OriginPort,OriginProto,Status,Timestamp,ClientTcpRtt,ClientTlsCipher,ClientTlsClientHelloServerName,ClientTlsProtocol,ClientTlsStatus,IpFirewall,OriginTcpRtt,OriginTlsCipher,OriginTlsFingerprint,OriginTlsMode,OriginTlsProtocol,OriginTlsStatus,ProxyProtocolV1,Spp,ProxyProtocol,Action,ClientASN,ClientASNDescription,ClientIPClass,ClientRefererHost,ClientRefererPath,ClientRefererQuery,ClientRefererScheme,ClientRequestHost,ClientRequestMethod,ClientRequestPath,ClientRequestProtocol,ClientRequestQuery,ClientRequestScheme,ClientRequestUserAgent,Datetime,EdgeColoCode,EdgeResponseStatus,Kind,MatchIndex,Metadata,OriginResponseStatus,OriginatorRayID,RayID,RuleID,Source&timestamps=rfc3339"
#   zone_id                     = var.cloudflare_zone_id
# }

# resource "cloudflare_logpush_job" "http_gcs" {
#   ownership_challenge         = cloudflare_logpush_ownership_challenge.http_gcs.ownership_challenge_filename
#   dataset                     = "http_requests"
#   destination_conf            = "gs://erfi-logs/http"
#   enabled                     = true
#   max_upload_interval_seconds = "30"
#   logpull_options             = "fields=ClientIP,ClientRequestHost,ClientRequestMethod,ClientRequestURI,EdgeEndTimestamp,EdgeResponseBytes,EdgeResponseStatus,EdgeStartTimestamp,RayID,BotScore,BotScoreSrc,BotTags,CacheCacheStatus,CacheResponseBytes,CacheResponseStatus,CacheTieredFill,ClientASN,ClientCountry,ClientDeviceType,ClientIPClass,ClientMTLSAuthCertFingerprint,ClientMTLSAuthStatus,ClientRequestBytes,ClientRequestPath,ClientRequestProtocol,ClientRequestReferer,ClientRequestScheme,ClientRequestSource,ClientRequestUserAgent,ClientSSLCipher,ClientSSLProtocol,ClientSrcPort,ClientTCPRTTMs,ClientXRequestedWith,Cookies,EdgeCFConnectingO2O,EdgeColoCode,EdgeColoID,EdgePathingOp,EdgePathingSrc,EdgePathingStatus,EdgeRateLimitAction,EdgeRateLimitID,EdgeRequestHost,EdgeResponseBodyBytes,EdgeResponseCompressionRatio,EdgeResponseContentType,EdgeServerIP,EdgeTimeToFirstByteMs,FirewallMatchesActions,FirewallMatchesRuleIDs,FirewallMatchesSources,JA3Hash,OriginDNSResponseTimeMs,OriginIP,OriginRequestHeaderSendDurationMs,OriginResponseBytes,OriginResponseDurationMs,OriginResponseHTTPExpires,OriginResponseHTTPLastModified,OriginResponseHeaderReceiveDurationMs,OriginResponseStatus,OriginResponseTime,OriginSSLProtocol,OriginTCPHandshakeDurationMs,OriginTLSHandshakeDurationMs,ParentRayID,RequestHeaders,ResponseHeaders,SecurityLevel,SmartRouteColoID,UpperTierColoID,WAFAction,WAFFlags,WAFMatchedVar,WAFProfile,WAFRuleID,WAFRuleMessage,WorkerCPUTime,WorkerStatus,WorkerSubrequest,WorkerSubrequestCount,ZoneID,ZoneName,CacheReserveUsed,WorkerWallTimeUs,BotDetectionIDs,ClientRegionCode,ContentScanObjResults,ContentScanObjTypes,WAFAttackScore,WAFRCEAttackScore,WAFSQLiAttackScore,WAFXSSAttackScore,SecurityAction,SecurityActions,SecurityRuleDescription,SecurityRuleID,SecurityRuleIDs,SecuritySources,Action,ClientASNDescription,ClientRefererHost,ClientRefererPath,ClientRefererQuery,ClientRefererScheme,ClientRequestQuery,Datetime,Description,Kind,MatchIndex,Metadata,OriginatorRayID,Ref,RuleID,Source,LeakedCredentialCheckResult&timestamps=rfc3339&CVE-2021-44228=false"
#   zone_id                     = var.cloudflare_zone_id
# }

