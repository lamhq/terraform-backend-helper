variable "owner" {
  type    = string
  description = "Email of resource owner"
}

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-central-1"
}
