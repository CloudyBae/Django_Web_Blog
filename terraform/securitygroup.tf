resource "aws_security_group" "django_sg" {
  name   = "django_sg"
  vpc_id = djangoblog_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [djangoblog_vpc.main.cidr_block]
    ipv6_cidr_blocks = [djangoblog_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "http"
    cidr_blocks      = [djangoblog_vpc.main.cidr_block]
    ipv6_cidr_blocks = [djangoblog_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "django_sg"
  }
}