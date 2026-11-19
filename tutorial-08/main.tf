
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

backend "s3" {
  bucket       = "jay-terraform-state-2026-unique-12345"
  key          = "tutorial-08/terraform.tfstate"
  region       = "us-west-2"
  encrypt      = true
  use_lockfile = true
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = "us-west-2"
}
