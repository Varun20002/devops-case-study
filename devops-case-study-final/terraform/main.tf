provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "shadowfax_vm" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_http_ssh.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io
              systemctl start docker
              docker pull ${var.docker_image}
              docker run -d -p 5000:5000 --name flask-app ${var.docker_image}
              EOF
}

resource "aws_security_group" "allow_http_ssh" {
  name = "allow_http_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
