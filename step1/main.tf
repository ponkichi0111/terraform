provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_subnet" "example_pub1" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-example"
  }
}

# resource "aws_internet_gateway" "example_ig" {
#   vpc_id = aws_vpc.example_vpc.id

#   tags = {
#     Name = "terraform-example"
#   }
# }

# resource "aws_route_table" "example_rt" {
#   vpc_id = aws_vpc.example_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.example_ig.id
#   }

#   tags = {
#     Name = "terraform-example"
#   }
# }

# resource "aws_route_table_association" "example_rt_a" {
#   subnet_id = aws_subnet.example_pub1.id
#   route_table_id = aws_route_table.example_rt.id
# }

# resource "aws_instance" "example_instance" {
#   ami = "ami-0a290015b99140cd1"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.example_pub1.id
#   associate_public_ip_address = true
#   vpc_security_group_ids = [ aws_security_group.example_sg.id ]

#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p 8080 &
#               EOF

#   user_data_replace_on_change = true

#   tags = {
#     Name ="terraform-example"
#   }
# }

# resource "aws_security_group" "example_sg" {
#   name = "terraform-example-sg"
#   vpc_id = aws_vpc.example_vpc.id

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }