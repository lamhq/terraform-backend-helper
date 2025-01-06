# create a random name for the bucket
resource "random_pet" "tf_states_bucket_name" {
  prefix    = "tf-states"
  length    = 1
  separator = "-"
}

# create an s3 bucket for storing Terraform states
resource "aws_s3_bucket" "tf_states_bucket" {
  bucket = random_pet.tf_states_bucket_name.id
}

# set ownership control for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "tf_states_bucket_own_ctl" {
  bucket = aws_s3_bucket.tf_states_bucket.id
  rule {
    # any objects uploaded to the bucket will default to being owned by the bucket owner rather than the object uploader
    object_ownership = "BucketOwnerPreferred"
  }
}

# sets the ACL for the S3 bucket
resource "aws_s3_bucket_acl" "tf_states_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.tf_states_bucket_own_ctl]
  bucket     = aws_s3_bucket.tf_states_bucket.id
  # only the bucket owner will have access to the bucket and its contents.
  acl = "private"
}

output "bucket_name" {
  description = "The S3 bucket for storing Terraform state of all projects"
  value = aws_s3_bucket.tf_states_bucket.bucket
}