vpc = {
    cidr_vpc_block = "10.0.0.0/16"
    public         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# rds values
rds = {
    identifier           = "mysql-database"
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t2.micro"
    name                 = "mydb"
    username             = "danial"
    password             = "pass2021"
    parameter_group_name = "default.mysql5.7"
}
#ec2 values
ec2 = {
    ami           = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"
    key_name      = "danial"
    name_wp       = "mydb"
    username_wp   = "danial"
    password_wp   = "pass2021"
}