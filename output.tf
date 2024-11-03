output "bucket_name" {
  description = "Created S3 bucket"
  value = aws_s3_bucket.backend_state_bucket.bucket
}