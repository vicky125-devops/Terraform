terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.3"
    }
  }


  backend "s3" {
    bucket = "workspaces-roopi"
    key = "expense-dev-frontend-backend-instances"
    region = "us-east-1"
    dynamodb_table = "roopi-dev"
  }
}  

# provide authentication here
provider "aws" {
  region = "us-east-1"
}