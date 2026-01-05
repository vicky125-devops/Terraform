variable "project_name" {
    default = "expense"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
  
}

variable "key_name" {
    type = string
    default = "roopi"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}