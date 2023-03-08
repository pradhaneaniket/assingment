
resource "aws_subnet" "private_subnet_az1" {
  cidr_block = var.private_subnet_az1_cidr
  vpc_id = var.vpc_id
  availability_zone_id = var.az1_name
  map_public_ip_on_launch = false
  tags = merge(
  {
    Name = "PrivateAZ-1",
    Type = "SUBNET"
  }
  )
}

resource "aws_subnet" "private_subnet_az2" {
  cidr_block = var.private_subnet_az2_cidr
  vpc_id = var.vpc_id   
  availability_zone_id = var.az2_name
  map_public_ip_on_launch = false
  tags = merge(
  {
    Name = "PrivateAZ-2",
    Type = "SUBNET"
  }
  )
}

resource "aws_subnet" "private_subnet_az3" {
  cidr_block = var.private_subnet_az3_cidr
  vpc_id = var.vpc_id   
  availability_zone_id = var.az3_name
  map_public_ip_on_launch = false
  tags = merge(
  {
    Name = "PrivateAZ-3",
    Type = "SUBNET"
  }
  )
}