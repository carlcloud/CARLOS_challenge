
resource "aws_lb" "challenge_alb" {
  name               = "challenge-alb1"
  load_balancer_type = "application"
  subnets = [
    "${aws_subnet.challenge_pub_sub-01.id}",
    "${aws_subnet.challenge_pub_sub-02.id}"
  ]
  security_groups = [aws_security_group.alb_sg.id]

  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.challenge_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.amazon_issued.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.challenge_target.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.challenge_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "challenge_target" {
  name     = "challenge-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.challenge_vpc.id

  health_check {
    enabled  = true
    path     = "/"
    port     = 80
    matcher  = "200"
    timeout  = 120
    interval = 300
    unhealthy_threshold = 3
    healthy_threshold = 3
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "target" {
  autoscaling_group_name = aws_autoscaling_group.challenge_asg.name
  lb_target_group_arn    = aws_lb_target_group.challenge_target.arn
}

