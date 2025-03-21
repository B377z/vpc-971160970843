resource "aws_lb" "web_alb" {
  name               = "bellzytech-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id
]
}

resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_alb_target_group.arn
  }
}

resource "aws_lb_target_group" "web_alb_target_group" {
  name     = "bellzytech-web-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.custom_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_asg.id
  lb_target_group_arn   = aws_lb_target_group.web_alb_target_group.arn
}