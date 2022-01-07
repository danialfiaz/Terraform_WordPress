variable "identifier" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "storage_type" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = number
}

variable "instance_class" {
  type = string
}

variable "name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "public" {
  type = list(any)
}

variable "vpc_id" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "wordpress_sg" {
  type = string
}