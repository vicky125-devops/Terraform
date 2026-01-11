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

variable "app_alb_sg_name" {
    default = "alb"
  
}

variable "vpn_sg_name" {
    default = "vpc"
  
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

variable "app_alb_sg_description" {
    default = "SG for alb Instances"
  
}

variable "vpn_sg_description" {
    default = "SG for vpn Instances"
  
}

variable "vpn_sg_rules" {
    default = [
        {
            from_port = 943
            to_port = 943
            protocol = "tcp"
            allowed_cidr = ["0.0.0.0/0"]
        },
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            allowed_cidr = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            protocol = "tcp"
            allowed_cidr = ["0.0.0.0/0"]
        },
        {
            from_port = 1194
            to_port = 1194
            protocol = "udp"
            allowed_cidr = ["0.0.0.0/0"]
        }
    ]
  
}
