output "bucket_name" {
  description = "The S3 bucket for storing project artifacts"
  value = aws_s3_bucket.artifact_bucket.bucket
}

output "dynamodb_table_name" {
  description = "Name of DynamoDB Table to use for Terraform state locking"
  value = aws_dynamodb_table.state_lock_table.name
}