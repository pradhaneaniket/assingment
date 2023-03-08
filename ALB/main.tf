#Target Group Creations

resource "aws_alb_target_group" "tg_nginx" {
  name     = "tg-nginx"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
  }
  tags = {
    name = "tg_nginx"
  }
}

resource "aws_lb" "alb_nginx" {
  name               = "albnginx"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ var.Security_Group_id ]
  subnets            = var.subnet_list
  depends_on = [ aws_alb_target_group.tg_nginx ]
  enable_deletion_protection = true
  tags = {
    Name = "ALB_NIGINX"
  }
}

resource "aws_alb_listener" "alb_listener" {
    load_balancer_arn = aws_lb.alb_nginx.arn
    port              = "80"
    protocol          = "HTTP"
    depends_on = [ aws_alb_target_group.tg_nginx ]
    default_action {
        target_group_arn =  aws_alb_target_group.tg_nginx.arn
        type = "forward"
        }
}