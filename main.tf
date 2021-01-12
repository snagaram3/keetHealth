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
# Configure the AWS EC2 Provider
provider "aws" {
  region = "us-east-1"
  access_key  = var.access_key
  secret_key  = var.secret_key

#Module creating EC2
module "keetEC2" {
  source        = "../Module"
  ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  }

#Installing docker
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apt-transport-https ca-certificates",
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "sudo sh -c 'echo \"deb https://apt.dockerproject.org/repo ubuntu-trusty main\" > /etc/apt/sources.list.d/docker.list'",
      "sudo apt-get update",
      "sudo apt-get install -y docker-engine=1.12.0-0~trusty",
      ]
    }
}

# Create a container
resource "docker_container" "keetNGINX" {
      image = "docker_image.nginx.latest"
      name  = "foo"
}

resource "docker_image" "nginx" {
      name = "nginx:latest"
}
