# ec2 variables
variable "instance_names" {
    type = list(string)
    default = [ "db", "backend", "frontend" ]

}

variable "image_id" {
    type = string
    default = "ami-0ecb62995f68bb549"
    description = "UBUNTU ami id"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "common_tags" {
    default = {
        project = "Expense"
        Environment = "Dev"
        Terraform = true
    }
  
}

# sg variables
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allow port 22"
  
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
  
}

variable "cidr" {
    # it needs a list of [string]
    default = ["0.0.0.0/0"]
  
}

# route53 variables
variable "zone_id" {
    default = "Z08884492QFPW45HM4UQO"
  
}

variable "domain_name" {
    default = "daws78s.online"
  
}