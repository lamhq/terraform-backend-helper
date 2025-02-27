# Terraform S3 Backend

## About

This repository simplifies the creation and management of necessary resources for Terraform S3 backend in AWS.

The resources created include:
- An S3 bucket for storing Terraform states of multiple projects
- A DynamoDB table for Terraform state locking

## Usage

Prepare a `params.tfvars` file that contain required input parameters:
```hcl filename="params.tfvars"
owner = ""
aws_region = ""
```

Use these commands to automatically create resources:
```shell
terraform init -reconfigure
terraform apply -var-file="params.tfvars" --auto-approve
```

Look for created resources in the console output.
```
Outputs:

bucket_name = "..."
dynamodb_table_name = "..."
```

To view previously created resources, run:
```shell
terraform output
```
