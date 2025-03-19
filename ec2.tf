resource "aws_instance" "web_servera" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.ec2_keypair_name

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
echo "You are on $(hostname), and the time is $(date)" > /var/www/html/index.html
echo "Powered by Terraform" >> /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
EOF

  tags = {
    Name = "bellzytech-ec2-web_servera"
  }

}
