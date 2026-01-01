resource "aws_instance" "pink-space" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-03add47bf19964172"]

    tags = {
      Name = "db"
    }

}