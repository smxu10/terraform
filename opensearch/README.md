### AWS OpenSearch 
#### 
1. User can use this terraform module to provision an OpenSearch domain.
#### 
2. It provisions a single node OpenSearch with public access.
#### 
3. User can access OpenSearch dashboard by using the master user credential. The master user credential is stored in AWS Secrets Manager.  
Before applying this Terraform module, the user needs to create a secret record for the OpenSearch master user credential in Secrets Manager. It should include two key/value pairs, one for username, the other for password.
#### 
4. The OpenSearch dashboard is available from the output this terraform module.
