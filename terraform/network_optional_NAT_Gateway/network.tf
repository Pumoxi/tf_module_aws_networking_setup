# AWS Elastic IP Address for NAT Gateway for Public Subnet Availability Zone 1

resource "aws_eip" "nat_eip_az1" {
  domain = "vpc"
}

# AWS Elastic IP Address for NAT Gateway for Public Subnet Availability Zone 2

resource "aws_eip" "nat_eip_az2" {
  domain = "vpc"
}

# AWS NAT Gateway for Public Subnet Availability Zone 1

resource "aws_nat_gateway" "nat_gateway_az1" {
    allocation_id = aws_eip.nat_eip_az1
    subnet_id = aws_subnet.public_subnet_az1
}

# AWS NAT Gateway for Public Subnet Availability Zone 2

resource "aws_nat_gateway" "nat_gateway_az2" {
    allocation_id = aws_eip.nat_eip_az2
    subnet_id = aws_subnet.public_subnet_az2
}

# Routing for Private Subnet Availability Zone 1

resource "aws_route_table" "private_route_table_az1" {
    vpc_id = var.vpc_id # Use the VPC ID from main terraform
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
    }
}

# AWS associate Public Route to Private Subnet AZ1

resource "aws_route_table_association" "private_subnet_az1_rt_assoc" {
    subnet_id = var.private_subnet_az1_id # Get the Subnet Private Subnet AZ1 from main terraform
    route_table_id = aws_route_table.private_route_table.id
}

# Routing for Private Subnet Available Zone 2

resource "aws_route_table" "private_route_table_az2" {
    vpc_id = var.vpc_id # Use the VPC ID from main terraform
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
    }
}
# AWS associate Public Route to Private Subnet AZ2

resource "aws_route_table_association" "private_subnet_az2_rt_assoc" {
    subnet_id = var.private_subnet_az2_id # Get the Subnet Private Subnet AZ2 from main terraform
    route_table_id = aws_route_table.private_route_table.id
}
