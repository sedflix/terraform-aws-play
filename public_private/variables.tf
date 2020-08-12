variable "region" {
  default = "ap-south-1"
  description = "EC2 Region for VPC"
}
variable "availability_zone" {
  default = "ap-south-1a"
}
variable "project_name" {
  default = "play"
  type = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_cidr" {
  default = "10.0.0.0/24"
}

variable "private_cidr" {
  default = "10.0.1.0/24"
}




variable "aws_key_path" {}
variable "aws_key_name" {}