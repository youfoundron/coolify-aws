resource "aws_vpc" "coolify_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "CoolifyVPC"
  }
}

resource "aws_eip" "coolify_ip" {
  instance = aws_instance.coolify_server.id
  vpc      = true
}
