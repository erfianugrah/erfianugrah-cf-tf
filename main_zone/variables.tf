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

variable "domain_name" {
  description = "The domain name to be used"
  type        = string
  sensitive   = true
}

variable "joplin_pem_path" {
  description = "joplin_pem_path"
  type = string
}

variable "joplin_key_path" {
  description = "joplin_key_path"
  type = string
}

variable "privatebin_pem_path" {
  description = "privatebin_pem_path"
  type = string
}

variable "privatebin_key_path" {
  description = "privatebin_key_path"
  type = string
}

variable "vaultwarden_pem_path" {
  description = "vaultwarden_pem_path"
  type = string
}

variable "vaultwarden_key_path" {
  description = "vaultwarden_key_path"
  type = string
}

variable "httpbun_ca_pem_path" {
  description = "httpbun_ca_pem_path"
  type = string
}

variable "httpbun_ca_key_path" {
  description = "httpbun_ca_key_path"
  type = string
}

variable "immich_pem_path" {
  description = "immich_pem_path"
  type = string
}

variable "immich_key_path" {
  description = "immich_key_path"
  type = string
}

variable "file_pem_path" {
  description = "file_pem_path"
  type = string
}

variable "file_key_path" {
  description = "file_key_path"
  type = string
}

variable "caddy_pem_path" {
  description = "caddy_pem_path"
  type = string
}

variable "caddy_key_path" {
  description = "caddy_key_path"
  type = string
}

variable "pages_domain" {
  description = "pages domain"
  type = string
}

variable "deno_domain" {
  description = "deno domain"
  type = string
}

variable "k3s_tunnel" {
  description = "k3s tunnel cname"
  type = string
}

variable "r2_access_key_id" {
  description = "r2 access key id"
  type = string
}

variable "r2_access_key" {
  description = "r2 access key"
  type = string
}
