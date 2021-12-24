data "aws_availability_zones" "azs" {}

module "VPC_module" {
  source            = "./modules/VPC"
  cidr_vpc_block    = var.cidr_vpc_block
  public            = var.public
  private           = var.private
  availability_zone = data.aws_availability_zones.azs.names
}


module "EC2" {
  source        = "./modules/EC2"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = "${module.VPC_module.vpc_id}"
  subnet_id     = "${module.VPC_module.public_subnets_ids}"
  rds_endpoint  = "${module.RDS.rds_endpoint}"
  name_wp       = var.name_wp
  username_wp   = var.username_wp
  password_wp   = var.password_wp
  

}

# RDS Module

module "RDS" {
  source = "./modules/RDS"
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.name
  parameter_group_name   = var.parameter_group_name
  username               = var.username
  password               = var.password
  vpc_id                 = "${module.VPC_module.vpc_id}"
  public                 = "${module.VPC_module.public_subnets_ids}"
  wordpress_sg           = "${module.EC2.wordpress_sg}"
}
