# Terraform S3 Backend

## About

This repository simplifies the process of creating and managing the necessary resources for setting up a Terraform backend with S3.


## Usage

1. Prepare a `params.tfvars` file that contain required input parameters:
    ```hcl filename="params.tfvars"
    owner = ""
    region = ""
    ```
2. Use `terraform apply` command to automatically create necessary AWS resources for Terraform s3 backend, including an S3 bucket
3. Look for the bucket name in the console output


## Frequently Used Commands

```shell
terraform apply -var-file="params.tfvars" --auto-approve
```