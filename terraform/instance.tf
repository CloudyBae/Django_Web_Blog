# this will be used as a bastion host to migrate database data to rds
resource "aws_instance" "djangoblog_web_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.public_web_subnet[0].id
  key_name                    = var.ami_key_pair_name
  vpc_security_group_ids      = ["${aws_security_group.webtier_sg.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "Django Blog WEB tier"
  }
}

# ENDED UP DEPLOYING APP TIER WITH ELASTIC BEAN STALK
# resource "aws_instance" "djangoblog_app_instance" {
#   ami           = var.ami_id
#   instance_type = var.instance_type

#   subnet_id                   = aws_subnet.private_app_subnet[0].id
#   key_name                    = var.ami_key_pair_name
#   vpc_security_group_ids      = ["${aws_security_group.django_sg.id}"]
#   associate_public_ip_address = false
#   user_data                   = "${file("data.sh")}"

#   tags = {
#     Name = "Django Blog"
#   }
# }