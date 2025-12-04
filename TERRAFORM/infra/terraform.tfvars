region = "us-east-1"

# vpc
vpc_cidr = "10.0.0.0/16"
vpc_name = "my_vpc"

# subnet
subnet_name = "my_subnet"
subnet_cidr = "10.0.1.0/24"

# igw
igw_name = "my_igw"

# rtb
rtb_name         = "my_rtb"
anywhere_ip_cidr = "0.0.0.0/0"

# sg
sg_name        = "my_sg"
sg_description = "my_sg"
ssh_port       = "22"
http_port      = "80"
https_port     = "443"

# ec2
ec2_name      = "my_ec2"
ami_id        = "ami-0fa3fe0fa7920f68e"
instance_type = "t3.micro"

# s3
s3_name = "backend-bucket"
