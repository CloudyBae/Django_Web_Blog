resource "aws_instance" "djangoblog_instance" {
  ami           = var.ami_id
  instance_type = "${var.instance_type}"
  count         = "${var.number_of_instances}"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "${var.ami_key_pair_name}"
  vpc_security_group_ids = aws_security_group.django_sg.id

  tags = {
    Name = "Django Blog"
  }
}