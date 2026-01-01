resource "aws_instance" "pink-space" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t2.micro"
    key_name = "roopi"
    vpc_security_group_ids = ["sg-03add47bf19964172"]

    # provisioners will run when we are creating resources
    # they will not run once the resources are created
    provisioner "local-exec" {
        command = "echo ${self.public_ip} > public_ips.txt" # self is aws_instance.web
      
    }

    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/pavankalyan/Downloads/roopi.pem")
    host        = self.public_ip

    }

    provisioner "remote-exec" {
        inline = [ "echo 'ssh is ready!'" ]
    
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt install nginx -y",
            "sudo apt install ansible -y",
            "sudo systemctl start nginx",
            "nginx -V"
        ]
      
    }

#    provisioner "local-exec" {
#        command = "export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i public_ips.txt -u ubuntu --private-key=/home/pavankalyan/Downloads/roopi.pem web.yaml"
#    }

}   
