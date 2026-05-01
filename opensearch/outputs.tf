output "opensearch_dashboard_url" {
  description = "The URL for the OpenSearch Dashboard"
  value       = "https://${aws_opensearch_domain.dev_domain.kibana_endpoint}"
}

