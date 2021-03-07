# ALB

resource "aws_alb" "alb" {
  name               = "${var.stack}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [aws_security_group.alb-sg.id]
}

# ALB TARGET GROUP

resource "aws_alb_target_group" "trgp" {
  name        = "${var.stack}-tgrp"
  port        = var.web_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
  health_check {
    enabled  = true
    interval = 10
    path     = "/"
    port     = var.web_port
    protocol = "HTTP"
    matcher  = "200-299"
  }
}

# ALB LISTENER

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = aws_alb.alb.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.trgp.id
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "trgp-attach" {
  count            = var.instance_count
  target_group_arn = aws_alb_target_group.trgp.arn
  target_id        = element(aws_instance.web.*.id, count.index)
  port             = var.web_port
}

