
provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
  shared_credentials_file = "~/.aws/sosol_credentials"
  profile = "sosol"
}

resource "aws_ecr_repository" "sosol_ecr_repo" {
  name = "sosol-ecr-repo"
}