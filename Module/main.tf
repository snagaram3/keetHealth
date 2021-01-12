
terraform {
  required_version = ">=0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    docker = {
    source = "kreuzwerker/docker"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"

resource "aws_instance" "keet_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
}
#output
output "instance_ip_addr" {
  value = aws_instance.keet_instance.private_ip
}
