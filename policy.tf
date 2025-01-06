resource "aws_iam_policy" "tf_backend_policy" {
  name = "tf-backend-mgmt-policy"
  description = "Permissions to manage Terraform backend resources on AWS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # manage terraform's stuff
      {
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : "${aws_s3_bucket.tf_states_bucket.arn}"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "${aws_s3_bucket.tf_states_bucket.arn}/*",
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ],
        "Resource" : "${aws_dynamodb_table.state_lock_table.arn}"
      },
    ]
  })
}

output "policy_arn" {
  description = "ARN of IAM policy for managing Terraform backend resources on AWS"
  value = aws_iam_policy.tf_backend_policy.arn
}