variable "ami_id" {
    type = string
    default = "ami-0ecb62995f68bb549"
  
}

variable "aws_security_group_ids" {
    type = list
    default = ["sg-03add47bf19964172"] # replace with you sg id
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "tags" {
    type = map
    default = {}  # this means empty, so not mandatory
}