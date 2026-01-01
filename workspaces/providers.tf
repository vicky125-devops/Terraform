terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.48.0"
    }
  }


  backend "s3" {
    bucket = "workspaces-roopi"
    key = "priya-workspace-demo"
    region = "us-east-1"
    dynamodb_table = "roopi-dev"
  }
}  

# provide authentication here
provider "aws" {
  region = "us-east-1"
}