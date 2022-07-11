resource "aws_vpc" "vpc" {
  cidr_block = var.public.vpc
  instance_tenancy = "default"
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public.public1
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public.public2
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public.private1
}
resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public.private2
}
resource "aws_subnet" "private3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public.private3
}
resource "aws_route_table" "route-vpc" {
  vpc_id = aws_vpc.vpc.id
   route {
    cidr_block = "0.0.0.0/0"               # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.igw.id
     }
}
resource "aws_route_table_association" "route1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route-vpc.id
}
resource "aws_route_table_association" "route2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.route-vpc.id
}
 #########security----group############################
 resource "aws_security_group" "new"{
  name        = "security-group"
  description = "allow for ssh"
  vpc_id      = aws_vpc.vpc.id
dynamic "ingress" {
  for_each = local.ingress_rules
  content{
    description = ingress.value.description
    from_port = ingress.value.port
    to_port = ingress.value.port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  }
  ##############instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "webserver" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  subnet_id = aws_subnet.public1.id
  security_groups = [aws_security_group.new.id]
  key_name = "publickey"
   tags = {
    Name = "hello"
  }
}
