resource "aws_instance" "roopi" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t2.micro"
    key_name = "roopi"
    vpc_security_group_ids = ["sg-03add47bf19964172"]

    tags = {
        Name = "remote-state"
    }
}    