output "ec2_instance" {
  value = aws_instance.wordpress.*.id
}


output "wordpress_sg" {
  value = aws_security_group.wordpress_sg.id
}


output "public_dns" {
  value = aws_instance.wordpress.*.public_dns
  
}