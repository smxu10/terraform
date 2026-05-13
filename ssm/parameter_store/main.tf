terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "backend-sean-1"
    key    = "tfstates/ssm/parameterstore/terraform.tfstate"
    acl    = "bucket-owner-full-control"
    region = "us-east-1"
  }
}

resource "aws_ssm_parameter" "db_dev" {
  name        = "/db/dev/ms_user"
  description = "Dev DB master user name"
  type        = "String"
  value       = "admin"

  tags = {
    Environment = "dev"
  }
}

resource "aws_ssm_parameter" "db_passwd" {
  name        = "/db/dev/ms_passwd"
  description = "Dev DB master user password"
  type        = "String"
  value       = "password"

  tags = {
    Environment = "dev"
  }
}
