variable "instance_names" {
    type = map(string)
    default = {
        db = "t2.small"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
  
}

variable "ami" {
    type = string
    default = "ami-0ecb62995f68bb549"
  
}

# route53 variables
variable "zone_id" {
    default = "Z08884492QFPW45HM4UQO"
  
}

variable "domain_name" {
    default = "daws78s.online"
  
}