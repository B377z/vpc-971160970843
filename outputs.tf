output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}


