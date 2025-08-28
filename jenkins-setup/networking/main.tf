# These come from the file terraform.tfvars
variable "vpc_cidr" {} 
variable "vpc_name" {}
variable "cidr_public_subnet" {}
variable "us_availability_zone" {}
variable "cidr_private_subnet" {}

output "dev_proj_1_vpc_id" {
  value = aws_vpc.pydevops_proj_1_vpc_us_east_1.id
}

output "pydevops_proj_1_public_subnets" {
  value = aws_subnet.pydevops_proj_1_public_subnets.*.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.pydevops_proj_1_public_subnets.*.cidr_block
}

# Setup VPC
resource "aws_vpc" "pydevops_proj_1_vpc_us_east_1" {
  cidr_block = var.vpc_cidr # This come from line 1 on this file
  tags = {
    Name = var.vpc_name # This come from line 2 on this file
  }
}

# Setup public subnet
resource "aws_subnet" "pydevops_proj_1_public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.pydevops_proj_1_vpc_us_east_1.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.us_availability_zone, count.index)

  tags = {
    Name = "pydevops-proj-public-subnet-${count.index + 1}"
  }
}

# Setup private subnet
resource "aws_subnet" "pydevops_proj_1_private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.pydevops_proj_1_vpc_us_east_1.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.us_availability_zone, count.index)

  tags = {
    Name = "pydevops-proj-private-subnet-${count.index + 1}"
  }
}