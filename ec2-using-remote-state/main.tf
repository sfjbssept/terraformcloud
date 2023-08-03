terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "Nishant-Amazon-Linux-instance" {
  count                  = 1
  ami                    = "ami-0ded8326293d3201b"
  instance_type          = var.instance_type
  key_name               = "Nishant-Keypair"
  user_data              = file("apache.sh")
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.terraform-cloud-nishant-group.id, ]
  tags = {
    Name = "Nishant machine no ${count.index + 1}"
  }
}
