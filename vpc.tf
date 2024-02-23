# Create a VPC to launch our instances into
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"  
  enable_dns_hostnames = true 
  enable_dns_support = true
  
  tags       =  {
    name     = "myvpc"
  }       
}
resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "myvpc"
  }
}
resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "myvpc"
  }
}
resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "myvpc"
  }
}
resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "myvpc"
  }
}
# Internet Gateway - to have Internet traffic in public subnets
resource "aws_internet_gateway" "my_IGW"{
    vpc_id = aws_vpc.dev_vpc.id
    tags = {
        Name = "myvpcigw"
    }
} 
# Routing tables

# Provides a resource to create a VPC routing table
resource "aws_route_table" "my_publicRouteTable1"{
    vpc_id = aws_vpc.dev_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_IGW.id
    }
    tags = {
        Name = "my_publicRoute1"
    }
}

