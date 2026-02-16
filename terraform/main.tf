provider "aws" {
  region = "eu-central-1"
}

# Create Security Group
resource "aws_security_group" "react_sg" {
  name        = "react-security-group"
  description = "Allow SSH, HTTP and HTTPS"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "react-sg"
  }
}

# Create EC2 Instance
resource "aws_instance" "react_server" {
  ami                    = "ami-01f79b1e4a5c64257"
  instance_type          = "t3.micro"
  key_name               = "test"   # ⚠️ remove .pem here
  vpc_security_group_ids = [aws_security_group.react_sg.id]

  tags = {
    Name = "react-server"
  }
}
