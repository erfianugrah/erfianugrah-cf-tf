variable "cloudflare_email" {
  description = "The email associated with the Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_user_id" {
  description = "Cloudflare Account User ID"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_key" {
  description = "The API key for accessing Cloudflare"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "The zone ID for the Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "secondary_cloudflare_zone_id" {
  description = "The zone ID for the secondary Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "thirdary_cloudflare_zone_id" {
  description = "The zone ID for the thirdary Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "The zone ID for the Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "sg_ip" {
  description = "sg static ip"
  type        = string
  sensitive   = true
}

variable "nl_ip" {
  description = "nl static ip"
  type        = string
  sensitive   = true
}

variable "spectrum_static_v6_1" {
  description = "spectrum static IP lease"
  type        = string
  sensitive   = true
}

variable "spectrum_static_v6_2" {
  description = "spectrum static IP lease"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "The domain name to be used"
  type        = string
  sensitive   = true
}

variable "secondary_domain_name" {
  description = "The secondary domain name to be used"
  type        = string
  sensitive   = true
}

variable "thirdary_domain_name" {
  description = "The thirdary domain name to be used"
  type        = string
  sensitive   = true
}

variable "joplin_pem_path" {
  description = "joplin_pem_path"
  type        = string
}

variable "joplin_key_path" {
  description = "joplin_key_path"
  type        = string
}

variable "privatebin_pem_path" {
  description = "privatebin_pem_path"
  type        = string
}

variable "privatebin_key_path" {
  description = "privatebin_key_path"
  type        = string
}

variable "vaultwarden_pem_path" {
  description = "vaultwarden_pem_path"
  type        = string
}

variable "vaultwarden_key_path" {
  description = "vaultwarden_key_path"
  type        = string
}

variable "httpbun_ca_pem_path" {
  description = "httpbun_ca_pem_path"
  type        = string
}

variable "httpbun_ca_key_path" {
  description = "httpbun_ca_key_path"
  type        = string
}

variable "immich_pem_path" {
  description = "immich_pem_path"
  type        = string
}

variable "immich_key_path" {
  description = "immich_key_path"
  type        = string
}

variable "file_pem_path" {
  description = "file_pem_path"
  type        = string
}

variable "file_key_path" {
  description = "file_key_path"
  type        = string
}

variable "caddy_pem_path" {
  description = "caddy_pem_path"
  type        = string
}

variable "caddy_key_path" {
  description = "caddy_key_path"
  type        = string
}

variable "httpbun_nl_pem_path" {
  description = "httpbun_nl_pem_path"
  type        = string
}

variable "httpbun_nl_key_path" {
  description = "httpbun_nl_key_path"
  type        = string
}
variable "pages_domain" {
  description = "pages domain"
  type        = string
}

variable "deno_domain" {
  description = "deno domain"
  type        = string
}

variable "k3s_tunnel" {
  description = "k3s tunnel cname"
  type        = string
}

variable "r2_access_key_id" {
  description = "r2 access key id"
  type        = string
}

variable "r2_access_key" {
  description = "r2 access key"
  type        = string
}

variable "logpush_secret" {
  description = "Shared secret for authenticating Logpush to the Loki endpoint"
  type        = string
  sensitive   = true
}

variable "cf_ips" {
  default = [
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "108.162.192.0/18",
    "131.0.72.0/22",
    "141.101.64.0/18",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "173.245.48.0/20",
    "188.114.96.0/20",
    "190.93.240.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "2400:cb00::/32",
    "2405:8100::/32",
    "2405:b500::/32",
    "2606:4700::/32",
    "2803:f800::/32",
    "2a06:98c0::/29",
    "2c0f:f248::/32"
  ]
}
