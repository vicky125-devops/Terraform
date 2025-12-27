output "ami_id" {
    value = data.aws_ami.ami_id.id
}

output "vpc_id_default" {
    value = data.aws_vpc.default.id
}