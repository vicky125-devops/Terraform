variable "project_name" {
    type = string
    default = "expense"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "common_tags" {
    default = {
        project_name = "expense"
        Environment = "dev"
        terraform = "true"
        Component = "app-alb"
    }
  
}

variable "zone_name" {
    default = "daws78s.online"
  
}