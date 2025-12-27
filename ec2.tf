# resource <resource_type> <resource_name>
resource "aws_security_group" "roopi" {
    name = var.sg_name
    description = var.sg_description
    vpc_id = "vpc-09cc45bcaea79a54e"

    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
# This is block
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr
    }
# This is map
    tags = {
      Name = "Allow all"
      createdBy = "pavankalyan"
    }
}

resource "aws_instance" "roopi" {
    ami = var.image_id
    instance_type = var.instance_type
    # left side things are arguments, right side are values
    key_name = "roopi"
    vpc_security_group_ids = [aws_security_group.roopi.id]

    tags = var.tags
}    