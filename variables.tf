# 1st command line
# 2nd tfvars
# 3rd default values
# 4th ENV variable
# 5th variable default value

variable "image_id" {
    type = string
    default = "ami-0ecb62995f68bb549"
    description = "UBUNTU ami id"
}

variable "instance_type" {
    default = "t3.micro"
    type = string
}

variable "tags" {
    default = {
        project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
  
}

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