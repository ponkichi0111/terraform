provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-0a6fd4c92fc6ed7d5"
  instance_type = "t2.micro"
  subnet_id = "subnet-09d30c885a0e5de46"

  tags = {
    Name ="terraform-example"
  }
}