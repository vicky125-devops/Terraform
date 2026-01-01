resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "allowing 22,80,8080,3306 access"

    dynamic "ingress" {
        for_each = var.inbound_rules
        content {
          from_port = ingress.value["port"]
          to_port = ingress.value["port"]
          protocol = ingress.value["protocol"]
          cidr_blocks = ingress.value["allowed_cidr"]
        }
      
    }
}