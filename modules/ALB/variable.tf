variable "vpc_id" {
  type = string
}
variable "public_subnet" {
  type = list(any)
}

variable "ec2_instance" {
  type = string
}