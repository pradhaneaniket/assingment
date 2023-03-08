provider "aws" {
  region     = var.aws_region
  access_key = ""
  secret_key = ""
}

data "aws_availability_zones" "AZ" {
  state = "available"
}

module "Network" {
  source                  = "./Subnets"
  vpc_id                  = data.aws_vpc.default_vpc_data.id
  private_subnet_az1_cidr = var.private_subnet_az1_cidr
  private_subnet_az2_cidr = var.private_subnet_az2_cidr
  private_subnet_az3_cidr = var.private_subnet_az3_cidr
  az1_name                = var.az1_name
  az2_name                = var.az2_name
  az3_name                = var.az3_name
}
module "NATGW" {
  source      = "./NATGW"
  subnet_list = data.aws_subnet_ids.public.ids
}
module "RT" {
  source     = "./RT"
  vpc_id     = data.aws_vpc.default_vpc_data.id
  nat_id     = module.NATGW.natgateway
  subnet_ids = tolist([module.Network.private_subnet_az1, module.Network.private_subnet_az2, module.Network.private_subnet_az3])
}
module "Security_Group" {
  source = "./Security-Group"
  vpc_id = data.aws_vpc.default_vpc_data.id
}

module "IAM" {
  source = "./IAM"
}

module "ASG" {
  source            = "./ASG"
  s3_access_profile = module.IAM.instance_profile
  subnet_ids = tolist([module.Network.private_subnet_az1, module.Network.private_subnet_az2, module.Network.private_subnet_az3])
  tg_arn = module.ALB.tgname
  Security_Group_id = module.Security_Group.ec2_App_Security_Group
}

module "ALB" {
  source            = "./ALB"
  vpc_id            = data.aws_vpc.default_vpc_data.id
  subnet_list       = data.aws_subnet_ids.public.ids
  Security_Group_id = module.Security_Group.elb_Security_Group
}

module "S3" {
  source = "./S3"
  
}