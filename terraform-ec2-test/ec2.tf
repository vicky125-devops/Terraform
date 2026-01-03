module "ec2-test" {
    source = "../terraform-aws-ec2"
    instance_type = "t2.small"

    tags = {
        Name = "modules"
        Terraform = "true"
    }  
}