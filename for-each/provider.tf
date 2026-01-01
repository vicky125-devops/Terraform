terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.48.0"
    }
  }


  backend "s3" {
    bucket = "roopa-pavan-priya143"
    key = "pavan-for-loop"
    region = "us-east-1"
    dynamodb_table = "roopa-locking"
  }
}  

# provide authentication here
provider "aws" {
  region = "us-east-1"
}