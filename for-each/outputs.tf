output "aws_instance_info" {
    value = {
        for name, instance in aws_instance.roopi : name => {
            id = instance.id
            public_ip = instance.public_ip
        
        }
    }
  
}