# create a random name for the bucket
resource "random_pet" "artifact_bucket_name" {
  prefix = "app-artifacts"
  length = 1
  separator = "-"
}

# create an s3 bucket for storing artifacts
resource "aws_s3_bucket" "artifact_bucket" {
  bucket = random_pet.artifact_bucket_name.id
}

# set ownership control for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "artifact_bucket_own_ctl" {
  bucket = aws_s3_bucket.artifact_bucket.id
  rule {
    # any objects uploaded to the bucket will default to being owned by the bucket owner rather than the object uploader
    object_ownership = "BucketOwnerPreferred"
  }
}

# sets the ACL for the S3 bucket
resource "aws_s3_bucket_acl" "artifact_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.artifact_bucket_own_ctl]
  bucket = aws_s3_bucket.artifact_bucket.id
  # only the bucket owner will have access to the bucket and its contents.
  acl    = "private"
}