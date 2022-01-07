variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = list(any)
}

variable "rds_endpoint" {
  type = string
}

variable "name_wp" {
  type = string
}

variable "username_wp" {
  type = string
}

variable "password_wp" {
  type = string
}

variable "alb_sg" {
  type = string
}