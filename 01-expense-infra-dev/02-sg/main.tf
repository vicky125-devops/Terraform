module "db" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.db_sg_description
    common_tags = var.common_tags
    sg_name = var.db_sg_name
  
}

module "frontend" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.frontend_sg_description
    common_tags = var.common_tags
    sg_name = var.frontend_sg_name
  
}

module "backend" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.backend_sg_description
    common_tags = var.common_tags
    sg_name = var.backend_sg_name
  
}

module "bastion" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.bastion_sg_description
    common_tags = var.common_tags
    sg_name = var.bastion_sg_name
  
}

module "app_alb" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.app_alb_sg_description
    common_tags = var.common_tags
    sg_name = var.app_alb_sg_name
    
}

module "vpn" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    sg_description = var.vpn_sg_description
    common_tags = var.common_tags
    sg_name = var.vpn_sg_name
    inbound_rules = var.vpn_sg_rules
  
}

# db is accepting coonections from backend
resource "aws_security_group_rule" "backend_db" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = module.backend.sg_id # source is from where you are getting traffic
    security_group_id = module.db.sg_id
  
}

resource "aws_security_group_rule" "bastion_db" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = module.bastion.sg_id # source is from where you are getting traffic
    security_group_id = module.db.sg_id
  
}

resource "aws_security_group_rule" "vpn_db" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = module.vpn.sg_id # source is from where you are getting traffic
    security_group_id = module.db.sg_id
  
}

resource "aws_security_group_rule" "alb_backend" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = module.app_alb.sg_id # source is from where you are getting traffic
    security_group_id = module.backend.sg_id
  
}

resource "aws_security_group_rule" "bastion_backend" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.bastion.sg_id # source is from where you are getting traffic
    security_group_id = module.backend.sg_id
  
}

resource "aws_security_group_rule" "vpn_backend_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.vpn.sg_id # source is from where you are getting traffic
    security_group_id = module.backend.sg_id
  
}

resource "aws_security_group_rule" "vpn_backend_http" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = module.vpn.sg_id # source is from where you are getting traffic
    security_group_id = module.backend.sg_id
  
}


resource "aws_security_group_rule" "public_frontend" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.frontend.sg_id
  
}

resource "aws_security_group_rule" "bastion_frontend" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.bastion.sg_id
    security_group_id = module.frontend.sg_id
  
}

resource "aws_security_group_rule" "public_bastion" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.bastion.sg_id
  
}

resource "aws_security_group_rule" "vpn_app_alb" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    source_security_group_id = module.vpn.sg_id
    security_group_id = module.app_alb.sg_id
  
}