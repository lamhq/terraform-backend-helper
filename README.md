# Terraform S3 Backend

## About

This repository simplifies the process of creating and managing the necessary resources for Terraform S3 backend.

The created resources include:
- An S3 bucket for storing Terraform states, deployed code, dependencies, ...
- A DynamoDB table for Terraform state locking


## Usage

Prepare a `input.tfvars` file that contain required input parameters:
```hcl filename="params.tfvars"
owner = ""
aws_region = ""
```

Use these commands to automatically create resources:
```shell
terraform init -reconfigure
terraform apply -var-file="input.tfvars" --auto-approve
```

Look for created resources in the console output.
```
Outputs:

bucket_name = "..."
dynamodb_table_name = "..."
```
