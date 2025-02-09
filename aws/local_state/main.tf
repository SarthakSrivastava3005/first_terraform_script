terraform {
  backend "s3" {
    encrypt = true
    bucket  = "307946651452-terraform-states"
    key     = "development/service-name.tfstate"
    region  = "us-west-2"
    dynamodb_table = "terraform-lock"
 }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

