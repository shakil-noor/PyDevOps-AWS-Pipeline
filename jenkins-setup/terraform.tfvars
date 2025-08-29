vpc_cidr             = "11.0.0.0/16"
vpc_name             = "pydevops-proj-jenkins-us-east-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
us_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKaEUXfUug+wdH3Q2DFvLwxuHxuqjiXQBRXeDdEg8mlj sakilnur@MacBookPro"
ec2_ami_id = "ami-0694d931cee176e7d"