provider "aws" {
  region = "us-east-1"
}

# Create the Secret container
resource "aws_secretsmanager_secret" "opensearch_credential" {
  name        = "opensearch/masteruser-dev"
  description = "Username and password for the dev opensearch"
}

# Create the Secret version with JSON data
resource "aws_secretsmanager_secret_version" "opensearch_credential_val" {
  secret_id = aws_secretsmanager_secret.opensearch_credential.id
  secret_string = jsonencode({
    username = "admin"
    password = "super-secret-password-123" # will be changed manually in AWS condole after it was created
  })
}
