terraform {
  backend "s3" {
    bucket = "bucket-for-storing-state-files"
    key    = "tffile.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "state_file_bucket" {
  bucket = "bucket-for-storing-state-files"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_instance" "app_server" {
  ami           = "ami-06eecef118bbf9259"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}