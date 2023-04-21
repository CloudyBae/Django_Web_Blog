# alb dns
output "lb_dns_name" {
  description = "alb dns"
  value       = "${aws_lb.django_alb.dns_name}"
}