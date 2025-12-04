# Create VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
  instance_tenancy = "default"
}

# Create Subnet

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create Route Table

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.rtb_name
  }
}

# Create Route Table Association

resource "aws_route_table_association" "public_rtb_assoc" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_rtb.id
}

# Create Route

resource "aws_route" "public_rtb_route" {
  route_table_id         = aws_route_table.public_rtb.id
  destination_cidr_block = var.anywhere_ip_cidr
  gateway_id             = aws_internet_gateway.igw.id
}

# Create Security Group

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.anywhere_ip_cidr]
  }
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.anywhere_ip_cidr]
  }
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.anywhere_ip_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.anywhere_ip_cidr]
  }
  tags = {
    Name = var.sg_name
  }
}

# Create EC2 Instance

resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_1.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.ec2_name
  }
}

# Create Random String

resource "random_id" "rand_id" {
  byte_length = 4
}

# Create S3 Bucket

resource "aws_s3_bucket" "s3" {
  bucket = "${var.s3_name}${random_id.rand_id.hex}"

  tags = {
    Name = "${var.s3_name}${random_id.rand_id.hex}"
  }
}

