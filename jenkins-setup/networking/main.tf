variable "vpc_cidr" {} # This come from the file terraform.tfvars
variable "vpc_name" {}

output "dev_proj_1_vpc_id" {
  value = aws_vpc.dev_proj_1_vpc_us_east_1.id
}

# Setup VPC
resource "aws_vpc" "dev_proj_1_vpc_us_east_1" {
  cidr_block = var.vpc_cidr # This come from line 1 on this file
  tags = {
    Name = var.vpc_name # This come from line 2 on this file
  }
}