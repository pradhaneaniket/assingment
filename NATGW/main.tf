
resource "aws_eip" "nateip"{
  vpc = true
}
locals {
  public_subnet_ids = [ for id in var.subnet_list : id ]
}

resource "aws_nat_gateway" "natgateway" {
  allocation_id = aws_eip.nateip.id
  subnet_id     = local.public_subnet_ids[0]
  connectivity_type = "public"
  tags = {
    Name = "NAT-GW"
  }
}