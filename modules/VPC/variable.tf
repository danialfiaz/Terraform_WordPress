variable "cidr_vpc_block" {
  type        = string
  description = "vpc cidr block"
}

#variable "vpc_id" {
#   type = string
#  description =" vpc id"  
#}

variable "public" {
  type        = list(any)
  description = ""
}


variable "private" {
  type        = list(any)
  description = ""
}


variable "availability_zone" {

}