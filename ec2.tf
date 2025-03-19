resource "aws_instance" "web_servera" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.ec2_keypair_name

  tags = {
    Name = "bellzytech-ec2-web_servera"
  }

}
