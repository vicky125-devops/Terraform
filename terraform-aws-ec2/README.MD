# Terraform AWS ec2 Module

## inputs:
* ami_id(optional): ami id is optional, Default value is ami-0ecb62995f68bb549 
* security_group_ids(optional): list of security group ids, default value is sg-03add47bf19964172
* instance_type(optioal): default value is t2.micro
* tags(optional): default value is empty.

## Outputs:
* public_ip: outputs the public IP of the instance created.
* privae_ip: outputs the private IP of the instance created.
* instance_id: outputs the instance ID created.
