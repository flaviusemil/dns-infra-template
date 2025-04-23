variable "cloudflare_api_token" {
  description = "API Token for Cloudflare"
  type = string
}

variable "cloudflare_zone_id" {
  description = "Zone ID of mondoartconcept.ro"
  type = string
}

variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "eu-central-1"
}
