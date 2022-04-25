# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# Resource Blocks
resource "aws_key_pair" "your_ssh_key" {
  key_name   = "your_ssh_key"
  public_key = var.your_ssh_key
}

resource "aws_instance" "coolify_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name      = aws_key_pair.your_ssh_key.key_name

  root_block_device {
    volume_size = 30
  }

  vpc_security_group_ids = [
    aws_security_group.coolify_sg.id
  ]

  user_data = <<-EOL
#!/bin/bash -xe
echo "Running Coolify setup!"
wget -q https://get.coollabs.io/coolify/install.sh -O install.sh
sudo bash ./install.sh -f --do-not-track
  EOL

  subnet_id = aws_subnet.coolify_public_subnet.id
  tags = {
    Name = var.coolify_server_instance_name
  }
}
