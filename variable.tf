variable "vpc"{
  type = object({
    cidr_vpc_block = string
    public         = list(string)
    private        =list(string)
    })
}
#RDS
variable "rds" {
  type = object({
    identifier            = string
    allocated_storage     = number
    storage_type          =string
    engine                = string
    engine_version        = number
    instance_class        =  string
    name                  = string
    username              = string
    password              = string
    parameter_group_name  = string
  })
}

#ec2 variables
variable "ec2" {
  type= object({
    ami           = string 
    instance_type = string
    key_name      = string
    name_wp       = string
    username_wp   = string 
    password_wp   = string
  })  
}