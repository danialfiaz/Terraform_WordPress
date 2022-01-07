resource "aws_lb" "alb" {
  name               = "${terraform.workspace}-APP-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet
}
resource "aws_lb_target_group" "alb_tg" {
  name        = "${terraform.workspace}-ALB-TG"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 4
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 20
    protocol            = "HTTP"
    path                = "/"
    matcher             = "302,200"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
resource "aws_lb_target_group_attachment" "ec2_instance" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.ec2_instance
  port             = 80
}

resource "aws_security_group" "alb_sg" {
 name         = "${terraform.workspace}-alb_sg"
  description = "For internet traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "incoming for ec2-instance"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${terraform.workspace}-alb_sg"
  }
}