# ------------------------------VPC Configuration-----------------------
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env}-vpc"
  }
}

# --------------------------------Public subnets----------------------------
resource "aws_subnet" "public_subnet_01" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_public_cidr_block1
  availability_zone = "us-west-1a"
  map_public_ip_on_launch= true
   tags = {
    Name = "${var.env}-public_subnet-01"
  }
}
resource "aws_subnet" "public_subnet_02" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_public_cidr_block2
  map_public_ip_on_launch= true
  availability_zone = "us-west-1c"
   tags = {
    Name = "${var.env}-public_subnet-02"
  }
}

#--------------------------------Privtae Subnets-----------------------------
resource "aws_subnet" "private_subnet_01" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_private_cidr_block1
  availability_zone = "us-west-1a"
   tags = {
    Name = "${var.env}-private_subnet-01"
  }
}
resource "aws_subnet" "private_subnet_02" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_private_cidr_block2
  availability_zone = "us-west-1c"
   tags = {
    Name = "${var.env}-private_subnet-02"
  }
}
