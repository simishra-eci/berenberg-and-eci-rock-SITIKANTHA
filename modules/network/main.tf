resource "aws_vpc" "BBG-VPC1" {
  cidr_block = "${var.network_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
  }
}
resource "aws_internet_gateway" "BBG-IG" {
  vpc_id = aws_vpc.BBG-VPC1.id

  tags = {
    Name = "BBG-IG"
  }
}
resource "aws_route_table" "BBG-RT" {
  vpc_id = aws_vpc.BBG-VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.BBG-IG.id
  }
   tags = {
    Name = "BBG-RT"
  }
}
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.BBG-VPC1.id
  route_table_id = aws_route_table.BBG-RT.id
}
resource "aws_subnet" "BBG-SUBNET1" {
  vpc_id = "${aws_vpc.BBG-VPC1.id}"
  cidr_block = "${var.subnet_cidr}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_subnet_name}"
  }
}
resource "aws_security_group" "BBG-SG1" {
  name        = "BBG-SG1"
  vpc_id      = aws_vpc.BBG-VPC1.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "BBG-SG1"
  }
}
