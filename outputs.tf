#ALB DNS name
output "ALB-DNS-NAME" {
  value = aws_alb.alb.dns_name
}