resource "aws_vpc" "vpc-vikinet" {
  cidr_block       = "198.168.0.0/22"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-vikinet"
  }
}

resource "aws_subnet" "snet-jumphosts" {
  vpc_id     = aws_vpc.vpc-vikinet.id
  cidr_block = "198.168.1.0/24"

  tags = {
    Name = "snet-jumphosts"
  }
}


resource "aws_subnet" "snet-web" {
  vpc_id     = aws_vpc.vpc-vikinet.id
  cidr_block = "198.168.2.0/24"

  tags = {
    Name = "snet-web"
  }
}
