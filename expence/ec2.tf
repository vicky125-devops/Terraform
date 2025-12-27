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

resource "aws_instance" "expence" {
    count = length(var.instance_names)
    ami = var.image_id
    instance_type = var.instance_names[count.index] == "db" ? "t2.medium" : "t2.small"
    # left side things are arguments, right side are values
    key_name = "roopi"
    vpc_security_group_ids = [aws_security_group.roopi.id]

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
            Module = var.instance_names[count.index]
        }
    )
}    
