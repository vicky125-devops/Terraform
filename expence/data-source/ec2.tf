resource "aws_instance" "priya" {
    ami = data.aws_ami.ami_id.id
}