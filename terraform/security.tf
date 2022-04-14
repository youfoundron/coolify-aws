resource "aws_security_group" "coolify_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic on port 80 (http)"
  vpc_id      = aws_vpc.coolify_vpc.id

  ingress {
    from_port   = 80
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
