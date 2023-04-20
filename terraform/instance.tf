resource "aws_instance" "djangoblog_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.private_app_subnet.id
  key_name                    = var.ami_key_pair_name
  vpc_security_group_ids      = ["${aws_security_group.django_sg.id}"]
  associate_public_ip_address = false

  tags = {
    Name = "Django Blog"
  }
}