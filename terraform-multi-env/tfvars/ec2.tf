resource "aws_instance" "roopi" {
    for_each = var.instance_names
    ami = data.aws_ami.ami_id.id
    vpc_security_group_ids = ["sg-03add47bf19964172"]
    instance_type = each.value
    tags = merge(
      var.common_tags,
      {
        Name = "${each.key}"
        Module = "${each.key}"
        Environment = var.environment
      }
    )
  
}