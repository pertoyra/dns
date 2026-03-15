variable "cloudflare_api_token" {
  description = "Cloudflare API token with Zone and DNS read/edit permissions"
  type        = string
  sensitive   = true
}

variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}
