data "aws_availability_zones" "azs" {}
module "VPC_module" {
  source            = "./modules/VPC"
  cidr_vpc_block    = var.vpc.cidr_vpc_block
  public            = var.vpc.public
  private           = var.vpc.private
  availability_zone = data.aws_availability_zones.azs.names
}


module "EC2" {
  source        = "./modules/EC2"
  ami           = var.ec2.ami
  instance_type = var.ec2.instance_type
  key_name      = var.ec2.key_name
  vpc_id        = module.VPC_module.vpc_id
  subnet_id     = module.VPC_module.private_subnets_ids
  rds_endpoint  = module.RDS.rds_endpoint
  name_wp       = var.ec2.name_wp
  username_wp   = var.ec2.username_wp
  password_wp   = var.ec2.password_wp
  alb_sg        = module.ALB.alb_sg


}

# RDS Module

module "RDS" {
  source               = "./modules/RDS"
  identifier           = var.rds.identifier
  allocated_storage    = var.rds.allocated_storage
  storage_type         = var.rds.storage_type
  engine               = var.rds.engine
  engine_version       = var.rds.engine_version
  instance_class       = var.rds.instance_class
  name                 = var.rds.name
  parameter_group_name = var.rds.parameter_group_name
  username             = var.rds.username
  password             = module.secret.secret_id.secret_string
  vpc_id               = module.VPC_module.vpc_id
  public               = module.VPC_module.public_subnets_ids
  wordpress_sg         = module.EC2.wordpress_sg
}

module "ALB" {
  source        = "./modules/ALB"
  vpc_id        = module.VPC_module.vpc_id
  public_subnet = module.VPC_module.public_subnets_ids
  ec2_instance  = module.EC2.ec2_instance

}
module "secret"{
  source   = "./modules/secret"
  password = var.rds.password
}