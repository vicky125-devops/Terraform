module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"

  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = local.bastion_sg_id
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.ami_id_info.id
  user_data = file("bastion.sh")

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }

  )
}