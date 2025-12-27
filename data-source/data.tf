data "aws_ami" "ami_id" {
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