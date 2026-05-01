provider "aws" {
  region = var.region
}


resource "aws_opensearch_domain" "dev_domain" {
  domain_name    = var.domain_name
  engine_version = var.engine_version

  cluster_config {
    instance_type            = var.instance_type
    instance_count           = var.instance_count
    dedicated_master_enabled = false
    zone_awareness_enabled   = false
  }

  # EBS options are required for most small instance types
  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  # Enable Fine-Grained Access Control with Master User
  advanced_security_options {
    enabled                        = true
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = local.os_creds.username
      master_user_password = local.os_creds.password
    }
  }

  # Mandatory requirements for Fine-Grained Access Control
  node_to_node_encryption {
    enabled = true
  }

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  # Basic Access Policy (Adjust CIDR or ARNs for your specific needs)
  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/dev-opensearch-node/*"
        }
    ]
}
CONFIG

  tags = {
    Environment = var.environment
  }
}

# Data sources to dynamically fetch account info for the policy
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
