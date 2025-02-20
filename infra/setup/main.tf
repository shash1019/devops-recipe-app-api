terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "devop-stf-state-shash01"
    key            = "tf-state-setup"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "devops_tf_locks"
  }
}

provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}