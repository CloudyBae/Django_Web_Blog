resource "aws_elastic_beanstalk_application" "django_blog" {
  name        = "django-blog"
}

resource "aws_elastic_beanstalk_environment" "djangoblog_env" {
  name                = "django-blog-env"
  application         = aws_elastic_beanstalk_application.django_blog.name
  solution_stack_name = "64bit Amazon Linux 2015.03 v2.0.3 running Python 3.8"
}