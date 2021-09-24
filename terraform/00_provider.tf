terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

# random string for sosol secret-key env variable
resource "random_string" "sosol-secret-key" {
  length           = 16
  special          = true
  override_special = "/@\" "
}
