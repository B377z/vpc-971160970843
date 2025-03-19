resource "aws_launch_template" "web_lt" {
  name_prefix   = "bellzytech-web-lt-"
  image_id      = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_keypair_name

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
echo "You are on $(hostname), and the time is $(date)" > /var/www/html/index.html
echo "Powered by Terraform" >> /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
EOF
  )

  vpc_security_group_ids = [aws_security_group.web_sg.id]
}
