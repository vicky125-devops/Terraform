data "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project_name}/${var.environment}/bastion_sg_id"
  
}

data "aws_ssm_parameter" "public_subnet_ids" {
    name = "/${var.project_name}/${var.environment}/public_subnet_id"
  
}

data "aws_ami" "ami_id_info" {
    most_recent = true
    owners = ["099720109477"]
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20251022"]
    }
}

data "aws_vpc" "default" {
    default = true
}
