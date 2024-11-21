# Security Group
resource "aws_security_group" "web_sg" {
  name        = "nginx-sg"
  description = "Security group for Nginx web server"
  vpc_id      = var.vpc_id

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Consider restricting to your IP
  }

  # All outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg-${var.name}"
  }
}

# EC2 Instance
resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  
  # Enable public IP
  associate_public_ip_address = true
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install -y nginx
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF
  tags = {
    Name = "nginx-${var.name}"
  }
}


