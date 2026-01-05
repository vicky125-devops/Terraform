module "db" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    db_sg_description = var.db_sg_description
    common_tags = var.common_tags
    sg_name = var.db_sg_name
  
}

module "frontend" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    db_sg_description = var.frontend_sg_description
    common_tags = var.common_tags
    sg_name = var.frontend_sg_name
  
}

module "backend" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    db_sg_description = var.backend_sg_description
    common_tags = var.common_tags
    sg_name = var.backend_sg_name
  
}

module "bastion" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    db_sg_description = var.bastion_sg_description
    common_tags = var.common_tags
    sg_name = var.bastion_sg_name
  
}

module "ansible" {
    source = "../../terraform-aws-sg"
    project_name = var.project_name
    db_sg_description = var.ansible_sg_description
    common_tags = var.common_tags
    sg_name = var.ansible_sg_name
  
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

resource "aws_security_group_rule" "frontend_backend" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = module.frontend.sg_id # source is from where you are getting traffic
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

resource "aws_security_group_rule" "ansible_backend" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.ansible.sg_id # source is from where you are getting traffic
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

resource "aws_security_group_rule" "ansible_frontend" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = module.ansible.sg_id
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
resource "aws_security_group_rule" "public_ansible" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = module.ansible.sg_id
  
}