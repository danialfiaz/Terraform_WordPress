variable "cidr_vpc_block" {
  type        = string
  description = "vpc cidr block"
}

variable "public" {
  type        = list(string)
  description = ""
}

variable "private" {
  type        = list(string)
  description = ""
}

variable "availability_zone" {
  type = list(string) 
}