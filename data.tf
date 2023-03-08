data "aws_vpc" "default_vpc_data" {
  default = true
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.default_vpc_data.id
  filter {
    name   = "tag:Subnet_Type"
    values = ["Public"]
  }
}

# output "Public_Subnets" {
#   value = data.aws_subnet_ids.public
# }
