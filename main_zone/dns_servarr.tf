# module "media_dns" (erfi.io servarr A records) removed 2026-09-05.
#
# erfi.io is delegated to Knot (ns1/ns2.erfi.io, authoritative; Knot serves
# each name as a direct A to the edge IP or a CNAME to the Workers custom
# domain <name>.erfi.io.cdn.cloudflare.net). Traffic for these hostnames never
# reaches the CF edge, so the CF-side proxied A records were unreachable dead
# weight - and while they stayed orange in the CF zone, CF kept treating the
# hostnames as CF-fronted (copyparty.erfi.io kept getting CF certs).
#
# TLS for all of them is origin-side: Caddy on the edge, LE via rfc2136
# DNS-01 against Knot (tls_config_rfc2136 in the edge Caddyfile).
#
# The retired set (23 proxied A records, all -> sg_ip):
#   atuin, authelia, bazarr, cadvisor, calibre, change, copyparty, dockge,
#   ech, httpbin, immich, jellyfin, joplin, navidrome, prowlarr, qbit, radarr,
#   sabnzbd, seerr, servarr, sonarr, tracearr, waf
#
# Re-add a record here (and only here) only if the name actually goes back
# through the CF edge.
