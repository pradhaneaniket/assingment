variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "az1_name" {
  type    = string
  default = "apse1-az1"
}
variable "az2_name" {
  type    = string
  default = "apse1-az2"
}
variable "az3_name" {
  type    = string
  default = "apse1-az3"
}

variable "private_subnet_az1_cidr" {
  type    = string
  default = "172.31.48.0/20"
}

variable "private_subnet_az2_cidr" {
  type    = string
  default = "172.31.64.0/20"
}

variable "private_subnet_az3_cidr" {
  type    = string
  default = "172.31.80.0/20"
}