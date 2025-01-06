# create a random name for the bucket
resource "random_pet" "state_lock_table_name" {
  prefix    = "tf-state-lock-table"
  length    = 1
  separator = "-"
}

# create a DynamoDB Table used for state locking
resource "aws_dynamodb_table" "state_lock_table" {
  name           = random_pet.state_lock_table_name.id
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "dynamodb_table_name" {
  description = "Name of a DynamoDB table to use for Terraform state locking"
  value = aws_dynamodb_table.state_lock_table.name
}