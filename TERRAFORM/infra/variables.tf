variable "region" {
  type    = string
  default = "us-east-1"
}

# VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  type    = string
  default = "my_vpc"
}

# Subnet

variable "subnet_name" {
  type    = string
  default = "my_subnet"
}
variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

# Internet Gateway
variable "igw_name" {
  type    = string
  default = "my_igw"
}

# Route Table
variable "rtb_name" {
  type    = string
  default = "my_rtb"
}

variable "anywhere_ip_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

# Security Group
variable "sg_name" {
  type    = string
  default = "my_sg"
}
variable "sg_description" {
  type    = string
  default = "my_sg"
}
variable "ssh_port" {
  type    = string
  default = "22"
}
variable "http_port" {
  type    = string
  default = "80"
}
variable "https_port" {
  type    = string
  default = "443"
}

# EC2
variable "ec2_name" {
  type    = string
  default = "my_ec2"
}
variable "ami_id" {
  type    = string
  default = "ami-0fa3fe0fa7920f68e"
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "key_name" {
  type    = string
  default = "my_key"
}

# S3
variable "s3_name" {
  type    = string
  default = "backend-bucket"
}



