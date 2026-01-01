# resource "aws_route53_record" "expence" {
#    for_each = aws_instance.roopi
#   zone_id = var.zone_id
#   name = each.key == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
#   type = "A"
#   ttl = 1
#   records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
#   # if records already exists it will overwrite it
#   allow_overwrite = true
# }   