data "template_file" "init" {
  template = "${file("${path.module}/template_file/init.sh")}"
  vars = {
    db_RDS = "${var.rds_endpoint}"
    db_name       = "${var.name_wp}"
    db_username     = "${var.username_wp}"
    db_user_password     = "${var.password_wp}"
  }
}

resource "aws_instance" "wordpress" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = "${var.subnet_id[0]}"
  security_groups = [aws_security_group.wordpress_sg.id]
  user_data       = "${data.template_file.init.rendered}"
  associate_public_ip_address = true


  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = "wordpress"
  }
}

resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "incoming traffic for ec2"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "For SSH in ec2"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "name" = "wordpress_sg"
  }
}
