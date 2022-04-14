resource "aws_subnet" "coolify_public_subnet" {
  vpc_id                  = aws_vpc.coolify_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  depends_on = [
    aws_internet_gateway.coolify_gw
  ]
}

resource "aws_route_table" "coolify_rt" {
  vpc_id = aws_vpc.coolify_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.coolify_gw.id
  }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.coolify_public_subnet.id
  route_table_id = aws_route_table.coolify_rt.id
}
