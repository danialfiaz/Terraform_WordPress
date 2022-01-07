# terraform {
#   backend "s3"{
#       bucket = "danial96"
#       key    = "state_file/terraform.tfstate"
#       region = "us-east-1"
#       dynamodb_table = "statefile_table"
#   }
# }