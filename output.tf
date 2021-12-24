output "vpc_id" {
  value = module.VPC_module.vpc_id
}


output "rds_endpoint" {
  value = module.RDS.rds_endpoint  
}


#output "rds_endpoint" {
 # value = "${aws_db_instance.mysql.endpoint}"
#}


output "private_subnet_ids" {
  value = "${module.VPC_module.private_subnets_ids}"
}

output "public_subnet_ids" {
  value = "${module.VPC_module.public_subnets_ids}"
}

output "ec2_instance_id" {
  value = "${module.EC2.ec2_instance}"
}

output "public_dns" {
  value = "${module.EC2.public_dns}"
}