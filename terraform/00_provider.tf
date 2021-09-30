terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.27.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

provider "cloudflare" {
  email     = var.cloudflare_email
  api_token = var.cloudflare_api_token
  # api_key = var.cloudflare_api_key
}

# random string for sosol secret-key env variable
resource "random_string" "sosol_secret_key" {
  length           = 16
  special          = true
  override_special = "/@\" "
}
