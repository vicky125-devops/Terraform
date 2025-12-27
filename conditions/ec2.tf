resource "aws_instance" "roopi" {
    ami = var.image_id
    instance_type = var.instance_name == "db" ? "t3.micro" : "t2.micro"
    key_name = "roopi"
}    