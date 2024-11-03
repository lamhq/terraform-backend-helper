resource "random_pet" "backend_state_bucket_name" {
  prefix = "terraform-backend"
  length = 4
}

resource "aws_s3_bucket" "backend_state_bucket" {
  bucket = random_pet.backend_state_bucket_name.id
}

resource "aws_s3_bucket_ownership_controls" "backend_state_bucket_own_ctl" {
  bucket = aws_s3_bucket.backend_state_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "backend_state_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.backend_state_bucket_own_ctl]

  bucket = aws_s3_bucket.backend_state_bucket.id
  acl    = "private"
}