variable "image_id" {
    type = string
    default = "ami-0ecb62995f68bb549"
    description = "UBUNTU ami id"
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "instance_name" {
    default = "db"
}