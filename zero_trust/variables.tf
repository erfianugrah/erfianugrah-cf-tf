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

variable "keycloak_saml_cert_1" {
  description = "keycloak_saml_cert_1"
  type        = string
  sensitive   = true
}
variable "keycloak_saml_cert_2" {
  description = "keycloak_saml_cert_2"
  type        = string
  sensitive   = true
}

variable "keycloak_oidc_secret" {
  description = "keycloak_oidc_secret"
  type        = string
  sensitive   = true
}

variable "keycloak_oidc_client_id" {
  description = "keycloak_oidc_client_id"
  type        = string
  sensitive   = true
}

variable "google_secret" {
  description = "google_secret"
  type        = string
  sensitive   = true
}

variable "google_client_id" {
  description = "google_client_id"
  type        = string
  sensitive   = true
}

variable "google_domain" {
  description = "google_domain"
  type        = string
  sensitive   = true
}

variable "google_sp_id" {
  description = "google_sp_id"
  type        = string
  sensitive   = true
}

variable "google_service_url" {
  description = "google_service_url"
  type        = string
  sensitive   = true
}

variable "google_workspace_secret" {
  description = "google_workspace_secret"
  type        = string
  sensitive   = true
}
variable "google_workspace_client_id" {
  description = "google_workspace_client_id"
  type        = string
  sensitive   = true
}

variable "authentik_oidc_secret" {
  description = "authentik_oidc_secret"
  type        = string
  sensitive   = true
}

variable "authentik_oidc_client_id" {
  description = "authentik_oidc_client_id"
  type        = string
  sensitive   = true
}

variable "entra_id_client_id" {
  description = "entra_id_client_id"
  type        = string
  sensitive   = true
}

variable "entra_id_secret" {
  description = "entra_id_secret"
  type        = string
  sensitive   = true
}

variable "entra_id_directory_id" {
  description = "entra_id_directory_id"
  type        = string
  sensitive   = true
}

variable "entra_scim_secret" {
  description = "entra_scim_secret"
  type        = string
  sensitive   = true
}

variable "erfi_corp" {
  description = "erfi_corp"
  type        = list(string)
  sensitive   = true
}

variable "unker" {
  description = "unker"
  type        = list(string)
  sensitive   = true
}

variable "lena_email" {
  description = "lena_email"
  type        = list(string)
  sensitive   = true
}

variable "oma_email" {
  description = "oma_email"
  type        = list(string)
  sensitive   = true
}

variable "authentik_pem_path" {
  description = "authentik_pem_path"
  type        = string
  sensitive   = true
}

variable "ssh_log_public_key" {
  description = "ssh_log_public_key"
  type        = string
  sensitive   = true
}

variable "authentik_saas_public_key" {
  description = "authentik public key"
  type        = string
  sensitive   = true
}

variable "authentik_saas_client_id" {
  description = "authentik_client_id"
  type        = string
  sensitive   = true
}

variable "authentik_saas_domain" {
  description = "authentik_domain"
  type        = string
  sensitive   = true
}

variable "authentik_saas_redirect_uris" {
  description = "array of uris"
  type        = list(string)
  sensitive   = true
}
