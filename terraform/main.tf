# create vpc
resource "aws_vpc" "djangoblog_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "djangoblog_vpc"
  }
}

# create public subnet
resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_subnet_cidr_block
  vpc_id     = aws_vpc.djangoblog_vpc.id

  tags = {
    Name = "djangoblog_public_subnet"
  }
}

# create private subnet
resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_subnet_cidr_block
  vpc_id     = aws_vpc.djangoblog_vpc.id

  tags = {
    Name = "djangoblog_private_subnet"
  }
}

# create internet gateway
resource "aws_internet_gateway" "djangoblog_igw" {
  vpc_id = aws_vpc.djangoblog_vpc.id
}

# create route tables
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.djangoblog_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.djangoblog_igw.id
  }

  tags = {
    Name = "djangoblog_public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.djangoblog_vpc.id

  tags = {
    Name = "djangoblog_private_rt"
  }
}

# subnet association with route tables
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidr_block)
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidr_block)
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}