
# ----------------------Route tables-------------------------
  resource "aws_route_table" "my_public_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.my_gy.id
     }
      tags = {
    Name = "${var.env}-public_route_table"
  }
  }

  resource "aws_route_table" "my_private_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id= aws_nat_gateway.nat.id

     }
      tags = {
    Name = "${var.env}-private_route_table"
  }
  }



# ------------------------ROute Table Association---------------
  resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.public_subnet_01.id
    route_table_id = aws_route_table.my_public_route_table.id
  }

  resource "aws_route_table_association" "private_route_table_association" {
    subnet_id = aws_subnet.private_subnet_01.id
    route_table_id = aws_route_table.my_private_route_table.id
  }

