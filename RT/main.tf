resource "aws_route_table" "private_subnet_rt" {

    vpc_id = var.vpc_id

    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = var.nat_id
    }
  
}

#Route Table Association to Private Subnets

resource "aws_route_table_association" "prvate_rt_as" {
    count          = length(var.subnet_ids)
    subnet_id      = var.subnet_ids[count.index]
    route_table_id = aws_route_table.private_subnet_rt.id
}