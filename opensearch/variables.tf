variable "domain_name" {
  description = "Opensearch Domain name"
  type        = string
}

variable "engine_version" {
  description = "Opensearch engion version"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_count" {
  description = "Number of opensearch EC2 instances to deploy"
  type        = number
}

variable "instance_type" {
  description = "Type of opensearch EC2 instance to use"
  type        = string
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
}

variable "ebs_volume_size" {
  description = "EBS volume size"
  type        = number
}

variable "environment" {
  description = "The environment where opensearch is deployed "
  type        = string
}
