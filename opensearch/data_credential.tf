# Find the secret by name
data "aws_secretsmanager_secret" "os_credentials" {
  name = "opensearch/masteruser-dev"
}

# Fetch the latest version of the secret value
data "aws_secretsmanager_secret_version" "os_credentials_version" {
  secret_id = data.aws_secretsmanager_secret.os_credentials.id
}

# Parse the JSON string into a map
locals {
  os_creds = jsondecode(data.aws_secretsmanager_secret_version.os_credentials_version.secret_string)
}
