module "backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-backend"

  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = local.backend_sg_id
  subnet_id     = local.private_subnet_id
  ami = data.aws_ami.ami_id_info.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-backend"
    }

  )
}

module "frontend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-frontend"

  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = local.frontend_sg_id
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.ami_id_info.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-frontend"
    }

  )
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-ansible"

  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = local.ansible_sg_id
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.ami_id_info.id
#  user_data = file("expense.sh")

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-ansible"
    }

  )
  depends_on = [ module.backend,module.frontend ]
}


module "zone" {
  source = "terraform-aws-modules/route53/aws"

  name    = var.zone_name

  records = {
    backend = {
      name           = "backend"
      type           = "A"
      ttl            = 1
      records        = [
        module.backend.private_ip
      ]
      
    }

    frontend = {
      name           = "frontend"
      type           = "A"
      ttl            = 1
      records        = [
        module.frontend.private_ip
      ]
      
    }

    root = {
      name           = var.zone_name
      type           = "A"
      ttl            = 1
      records        = [
        module.frontend.public_ip
      ]
      
    }

  }
}  
