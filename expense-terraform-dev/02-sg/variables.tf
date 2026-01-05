variable "project_name" {
    default = "expense"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}


variable "db_sg_name" {
    default = "db"
  
}

variable "frontend_sg_name" {
    default = "frontend"
  
}

variable "backend_sg_name" {
    default = "backend"
  
}

variable "bastion_sg_name" {
    default = "bastion"
  
}

variable "ansible_sg_name" {
    default = "ansible"
  
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
  
}

variable "db_sg_description" {
    default = "SG for DB MySQL Instances"
  
}

variable "frontend_sg_description" {
    default = "SG for frontend Instances"
  
}

variable "backend_sg_description" {
    default = "SG for backend Instances"
  
}

variable "bastion_sg_description" {
    default = "SG for bastion Instances"
  
}

variable "ansible_sg_description" {
    default = "SG for ansible Instances"
  
}


