resource "aws_internet_gateway" "coolify_gw" {
  vpc_id = aws_vpc.coolify_vpc.id
}
