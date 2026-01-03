# Custom AWS VPC module

This module is developed for joindevops.com, we are creating following resources. This module creates resources in first 2 AZ for Higher Availability

* VPC
* interner gateway
* internet and vpc attachment
* 2 public subnets
* 2 private subnets
* 2 database subnets
* EIP
* NAT gateway
* Public route table
* Private route table
* Database route table
* Route table and subnet associations
* Routes in all tables
* Peering if required for user
* Routes of peering in requestor anf acceptor vpc.
* database subnet group

### Inputs
* project_name(Required): user should mention their project name. type is string.
* environment (optional): Default value is dev, type is string.
* common_tags(required): user should provide their tags related to their project, type is map.
* vpc_cidr(optional): default value is 10.0.0.0/16, type is string
* enable_dns_hostnames(optional): default value is true, type is bool
* vpc_tags(optional): default value is empty, type is map.
* igw_tags(optional): default value is empty, type is map.
* public_subnet_cidrs(required): user has to provide 2 valid subnet CIDR.
* public_subnet_cidr_tags(optional): default value is empty, type is map
* private_subnet_cidrs(required): user has to provide 2 valid subnet CIDR.
* private_subnet_cidr_tags(optional): default value is empty, type is map
* database_subnet_cidrs(required): user has to provide 2 valid subnet CIDR.
* database_subnet_cidr_tags(optional): default value is empty, type is map
* database_subnet_group_tags(optional): default value is empty, type is map
* nat_gateway_tags(optional): default value is empty, type is map
* public_route_table_tags(optional): default value is empty, type is map
* private_route_table_tags(optional): default value is empty, type is map
* database_route_table_tags(optional): default value is empty, type is map
* is_peering_required(optional): default value is false, type is bool
* acceptor_vpc_id(optional): default value is empty, default vpc id would be taken, type is string
* vpc_peering_tags(optional): default value is empty, type is map

### outputs
* vpc_id: VPC ID
* public_subnet_ids: A list of 2 public subnet IDS created.
* database_subnet_ids: A list of 2 database subnet IDS created.
* private_subnet_ids: A list of 2 private subnet IDS created.
* database_subnet_group_id: A database subnet group ID created.
* igw_id: internte gateway created.