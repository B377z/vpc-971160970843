resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id
  ]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "web-instance"
    propagate_at_launch = true
  }
}
