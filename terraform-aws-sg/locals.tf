locals {
  sg_name_final = "${var.project_name}-${var.environment}-${var.sg_name}"
  ssm_vpc_id = data.aws_ssm_parameter.vpc_id.value
}