# count and count.index will not work in locals
# locals {
# record_name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
# records = [aws_instance.expence[count.index]] == "frontend" ? [aws_instance.expence[count.index].public_ip] : [aws_instance.aws_instance.expence[count.index].private_ip]
# }