variable "instance_names" {
    type = map
    default = {
        db-dev = "t2.small"
        backend-dev = "t2.micro"
        frontend-dev = "t2.micro"
    }
}

variable "environment" {
    default = "dev"
  
}

variable "common_tags" {
    type = map
    default = {
        project = "multi-env"
        terraform = "true"
    }
}

variable "domain_name" {
    default = "daws78s.online"
}

variable "zone_id" {
    default = "Z08884492QFPW45HM4UQO"  
}