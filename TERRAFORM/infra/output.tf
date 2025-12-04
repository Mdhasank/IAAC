output "region" {
  value = var.region
}

# vpc
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

# subnet
output "subnet_id" {
  value = aws_subnet.subnet_1.id
}

# igw
output "igw_id" {
  value = aws_internet_gateway.igw.id
}

# rtb
output "rtb_id" {
  value = aws_route_table.public_rtb.id
}

# sg
output "sg_id" {
  value = aws_security_group.sg.id
}

# ec2
output "ec2_id" {
  value = aws_instance.ec2.id
}
# s3
output "s3_id" {
  value = aws_s3_bucket.s3.id
}


