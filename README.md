# Terraform AWS Networking Setup

This Terraform configuration sets up an AWS Virtual Private Cloud (VPC) with both public and private subnets across two availability zones. It includes optional deployment of a NAT Gateway, security groups, internet gateway, and routing configurations.

## Features

- **VPC Creation**: Creates a VPC with customizable CIDR blocks.
- **Public and Private Subnets**: Sets up two public and two private subnets across two availability zones (AZ1 and AZ2).
- **Security Groups**: Configures a default security group to allow HTTP and all egress traffic.
- **Internet Gateway**: Attaches an internet gateway for public subnets.
- **Conditional NAT Gateway Deployment**: Optionally deploys NAT Gateways in each public subnet for outbound internet access from private subnets, based on the `bool_nat_gateway` variable.
- **Routing Tables**: Sets up public and private route tables to route traffic appropriately for each subnet type.

## Prerequisites

- Terraform 0.12 or later
- AWS account with permissions to create VPC resources

## Usage

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your_username/terraform-aws-networking-setup.git
   cd terraform-aws-networking-setup
   ```
