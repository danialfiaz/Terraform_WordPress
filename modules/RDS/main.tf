resource "aws_db_instance" "mysql" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.name 
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  tags = {
    "Name" = "RDS_instance"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
    name       = "subnet_db"
    subnet_ids = [var.public[0], var.public[1]]
    tags = {
      "Name"   = "subnet_group"
    }
  
}


resource "aws_security_group" "mysql_sg" {
    name        = "mysql_sg"
    description = "Allow TLS inbound traffic"
    vpc_id      = var.vpc_id

    ingress {
    description      = "invoming traffic"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [var.wordpress_sg]
    cidr_blocks     = ["10.0.0.0/16"]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "name" = "mysql_sg"
  }
}