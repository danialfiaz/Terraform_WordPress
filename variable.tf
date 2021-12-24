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




#RDS

variable "identifier" {

}


variable "allocated_storage" {

}


variable "storage_type" {

}


variable "engine" {

}


variable "engine_version" {

}

#variable "wordpress_sg" {
#
#}

variable "instance_class" {

}


variable "name" {

}


variable "username" {

}


variable "password" {

}






#variable "vpc_id" {
#
#}
variable "parameter_group_name" {
    
}


#ec2 variables

variable "ami" {
  
}

variable "instance_type" {
  
}

variable "key_name" {
  
}

variable "name_wp" {
  
}

variable "username_wp" {
  
}

variable "password_wp" {
  
}