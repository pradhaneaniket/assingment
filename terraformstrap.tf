terraform {
  backend "s3" {
    bucket         = "assingment-state-bucket"
    key            = "ASSINGMENT-TF/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "tf-state-lock"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
