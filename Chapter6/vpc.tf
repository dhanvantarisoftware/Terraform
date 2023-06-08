resource "aws_vpc" "my-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "myvpc-pub-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "myvpc-pub-1"
  }
}

resource "aws_subnet" "myvpc-pub-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "myvpc-pub-2"
  }
}

resource "aws_subnet" "myvpc-pub-3" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "myvpc-pub-3"
  }
}

resource "aws_subnet" "myvpc-priv-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "myvpc-priv-1"
  }
}

resource "aws_subnet" "myvpc-priv-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "myvpc-priv-2"
  }
}

resource "aws_subnet" "myvpc-priv-3" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "myvpc-priv-3"
  }
}

resource "aws_internet_gateway" "my-IGW" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-IGW"
  }
}

resource "aws_route_table" "my-pub-RT" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-IGW.id
  }

  tags = {
    Name = "my-pub-RT"
  }
}

resource "aws_route_table_association" "my-pub-1-a" {
  subnet_id      = aws_subnet.myvpc-pub-1.id
  route_table_id = aws_route_table.my-pub-RT.id
}

resource "aws_route_table_association" "my-pub-2-a" {
  subnet_id      = aws_subnet.myvpc-pub-2.id
  route_table_id = aws_route_table.my-pub-RT.id
}

resource "aws_route_table_association" "my-pub-3-a" {
  subnet_id      = aws_subnet.myvpc-pub-3.id
  route_table_id = aws_route_table.my-pub-RT.id
}