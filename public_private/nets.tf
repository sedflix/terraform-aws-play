resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_cidr
  vpc_id = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone
  tags = {
    visibility = "public"
  }
}

resource "aws_subnet" "private_subnet_1" {
  cidr_block = var.private_cidr
  vpc_id = aws_vpc.main_vpc.id
  map_public_ip_on_launch = false
  availability_zone = var.availability_zone
  tags = {
    visibility = "private"
  }
}