# Terraform S3 Backend

## About

This repository simplifies the process of creating and managing the necessary resources for AWS projects.

The created resources include:
- An S3 bucket for storing Terraform states, deployed code, dependencies, ...
- A DynamoDB table for Terraform state locking

## Usage

1. Prepare a `params.tfvars` file that contain required input parameters:
    ```hcl filename="params.tfvars"
    owner = ""
    region = ""
    ```
2. Use `terraform apply` command to automatically create necessary AWS resources
3. Look for created resources in the console output


## Frequently Used Commands

Preview changes:
```shell
terraform plan -var-file="params.tfvars"
```

Deploy:
```shell
terraform apply -var-file="params.tfvars" --auto-approve
```