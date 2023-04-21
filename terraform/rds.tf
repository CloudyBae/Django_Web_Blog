# Creating RDS Instance
resource "aws_db_subnet_group" "django_rds_subnet_group" {
  name       = "main"
  subnet_ids = aws_subnet.private_db_subnet.*.id
    tags = {
        Name = "My DjangoBlog DB subnet group"
    }
}
resource "aws_db_instance" "django_rds" {
  identifier             = "django-blog"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = var.db_user
  password               = var.db_pass
  db_subnet_group_name   = aws_db_subnet_group.django_rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.dbtier_sg.id]
  skip_final_snapshot    = true
}