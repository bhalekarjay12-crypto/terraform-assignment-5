terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

module "my_ec2" {
  source = "./modules/ec2"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  instance_name = "EC2-Using-Module"
}

output "instance_id" {
  value = module.my_ec2.instance_id
}

output "public_ip" {
  value = module.my_ec2.public_ip
}
