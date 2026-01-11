resource "aws_key_pair" "vpn" {
    key_name = "openvpn"
    # you can paste the public key directly like this
    # public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJj/friEXbs63/9xZ67siULRblpc+4cqABlVaEczRo+ pavankalyan@pavankalyan-HP-Laptop-15s-gr0xxx"
    public_key = file("/home/pavankalyan/.ssh/openvpn.pub")
  
}

module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-openvpn"

  instance_type = var.instance_type
  key_name      = aws_key_pair.vpn.key_name
  vpc_security_group_ids = local.vpn_sg_id
  subnet_id     = local.public_subnet_id
  ami = data.aws_ami.ami_id_info.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-openvpn"
    }

  )
}