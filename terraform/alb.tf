resource "aws_lb" "django_alb" {
  name               = "djangoblog-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webtier_sg.id]
  subnets            = aws_subnet.public_web_subnet.*.id
}

resource "aws_lb_target_group" "django_target_group" {
  name     = "Django-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.djangoblog_vpc.id
}

resource "aws_lb_target_group_attachment" "django_tg_attach" {
  target_group_arn = aws_lb_target_group.django_target_group.arn
  target_id        = aws_instance.djangoblog_web_instance.id #change to app after elastic beanstalk deployment
  port             = 80

}

resource "aws_lb_listener" "django_alb_listener" {
  load_balancer_arn = aws_lb.django_alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.django_target_group.arn
  }
}