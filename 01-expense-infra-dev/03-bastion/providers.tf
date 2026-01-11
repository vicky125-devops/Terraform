terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.28"
    }
  }


  backend "s3" {
    bucket = "workspaces-roopi"
    key = "expense-infra-dev-bastion"
    region = "us-east-1"
    dynamodb_table = "roopi-dev"
  }
}  

# provide authentication here
provider "aws" {
  region = "us-east-1"
}