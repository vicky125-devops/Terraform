 resource "aws_route53_record" "expence" {
    count = length(var.instance_names)
    zone_id = var.zone_id
    name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.expence[count.index]] == "frontend" ? [aws_instance.expence[count.index].public_ip] : [aws_instance.aws_instance.expence[count.index].private_ip]
    # if records already exists it will overwrite it
    allow_overwrite = true
}