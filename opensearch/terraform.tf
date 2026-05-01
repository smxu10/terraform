terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket  = "backend-sean-1"
    key     = "tfstates/opensearch/dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
