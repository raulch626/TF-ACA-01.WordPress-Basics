
  
  #Create VPC
  resource "aws_vpc" "main" {
    cidr_block       = "10.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
  
    tags = {
      Name = "A4LVPC"
    }
  }
  
  # Create subnets
  
  
  resource "aws_subnet" "sn-DB-A" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.16.0/20"  
    availability_zone = "ca-central-1a"
    
    tags = {
      Name = "sn-db-A"
      }
  }

  resource "aws_subnet" "sn-app-A" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.32.0/20"  
    availability_zone = "ca-central-1a"
    
    tags = {
      Name = "sn-app-A"
      }
  }
  
  resource "aws_subnet" "sn-web-A" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.48.0/20"  
    availability_zone = "ca-central-1a"
    map_public_ip_on_launch = true
    
    tags = {
      Name = "sn-web-A"
      }
  }
  
  resource "aws_subnet" "sn-db-B" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.80.0/20"  
    availability_zone = "ca-central-1b"
    
    tags = {
      Name = "sn-db-B"
      }
  }
  
  resource "aws_subnet" "sn-app-B" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.96.0/20"  
    availability_zone = "ca-central-1b"
    
    tags = {
      Name = "sn-app-B"
      }
  }
  
  resource "aws_subnet" "sn-web-B" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.112.0/20"  
    availability_zone = "ca-central-1b"
    map_public_ip_on_launch = true

    
    tags = {
      Name = "sn-web-B"
      }
  }
  
  resource "aws_subnet" "sn-db-C" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.144.0/20"  
    availability_zone = "ca-central-1c"
    
    tags = {
      Name = "sn-db-C"
      }
  }
  
  resource "aws_subnet" "sn-app-C" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.160.0/20"  
    availability_zone = "ca-central-1c"
    
    tags = {
      Name = "sn-app-C"
      }
  }
  
  resource "aws_subnet" "sn-web-C" {
  
    vpc_id     = aws_vpc.main.id
    cidr_block 	= "10.16.176.0/20"  
    availability_zone = "ca-central-1c"
    map_public_ip_on_launch = true
    
    tags = {
      Name = "sn-web-C"
      }
  }