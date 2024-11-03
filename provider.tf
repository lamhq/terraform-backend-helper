terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
 
    # provides a data source that can create archives from individual files or collections of files
    # useful for packaging code files to be deployed
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4.2"
    }
 
    # provide resources to generate random values
    # useful for creating unique resource identifiers
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
  }
}
 
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      owner = var.owner
    }
  }
}