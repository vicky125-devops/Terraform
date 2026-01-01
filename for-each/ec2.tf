resource "aws_instance" "roopi" {
    for_each = var.instance_names  # each.key and each.value
    ami = var.ami
    instance_type = each.value
    key_name = "roopi"
    vpc_security_group_ids = ["sg-03add47bf19964172"]
    tags = {
        Name = each.key
        Module = each.key
    }
}