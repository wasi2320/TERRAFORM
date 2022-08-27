# ---------------------Internet Gateway------------
  resource "aws_internet_gateway" "my_gy" {
      vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name= "${var.env}-gateway"
    }
  }
# ----------------------NAT Gateway ------------------------
# Elastic-IP (eip) for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
}

# NAT
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.private_subnet_01.id
  tags = {
    Name        = "${var.env}-nat"
  }
}
