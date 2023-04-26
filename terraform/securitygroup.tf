resource "aws_security_group" "webtier_sg" {
  name = "webtier_sg"
  vpc_id = "${aws_vpc.djangoblog_vpc.id}"
  
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ip]
  }
  
  egress {
    description = "Internet access to anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "DjangoBlog Web SG"
  }
}

resource "aws_security_group" "django_sg" {
  name   = "django_sg"
  vpc_id = aws_vpc.djangoblog_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ip]
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.webtier_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "DjangoBlog App SG"
  }
}

resource "aws_security_group" "dbtier_sg" {
  name        = "dbtier_sg"
  description = "Allows inbound traffic from application tier"
  vpc_id      = aws_vpc.djangoblog_vpc.id
ingress {
    description     = "Allows traffic from app tier"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.django_sg.id]
  }
egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "DjangoBlog Database SG"
  }
}