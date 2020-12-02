# Configure the provider
provider "aws" {
    profile = "default"
    region  = "ca-central-1"
  }


# Create an internet gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
    Name = "IGW"
    }
  }
  
  
  # Create a custom route table
  resource "aws_route_table" "rt_table" {
    vpc_id = aws_vpc.main.id
  
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
    Name = "a4l-vpc1-rt-web"
    }
  }
   

  # Associate subnets with Route Table
resource "aws_route_table_association" "rtA" {
    subnet_id      = aws_subnet.sn-web-A.id
    route_table_id = aws_route_table.rt_table.id
  }

resource "aws_route_table_association" "rtB" {
    subnet_id      = aws_subnet.sn-web-B.id
    route_table_id = aws_route_table.rt_table.id
  }

resource "aws_route_table_association" "rtC" {
    subnet_id      = aws_subnet.sn-web-C.id
    route_table_id = aws_route_table.rt_table.id
  }  
