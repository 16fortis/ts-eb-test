# VPN Gateway (optional, depends on your specific needs)
resource "aws_vpn_gateway" "example_vgw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Route table association
resource "aws_route_table_association" "example_rta" {
  subnet_id      = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.example_rt.id
  #vpc_id        = aws_vpc.example.id  # Make sure this references your VPC
}

resource "aws_route_table" "example_rt" {
  vpc_id = aws_vpc.example_vpc.id
  # Include other routes or configurations if needed
}
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}
