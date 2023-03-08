
resource "aws_launch_template" "webapp" {
    name_prefix   = "webapp"
    image_id      = "ami-03f6a11788f8e319e"
    instance_type = "t2.micro"
    key_name = "WebApp"
    user_data = filebase64("./custom_scripts/nginx.sh")
    vpc_security_group_ids = [ var.Security_Group_id ]
    tags = {
      Name = "CounterWebApp"
    }
    iam_instance_profile {
      name = var.s3_access_profile.id
    }
}

resource "aws_autoscaling_group" "countapp" {
  name                 = "counter-app"
  launch_template {
    id      = aws_launch_template.webapp.id
    #version = "$Latest"
    version = aws_launch_template.webapp.latest_version
    }
  min_size             = 1
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = var.subnet_ids
  health_check_type    = "ELB"
  target_group_arns    = [var.tg_arn]
  lifecycle {
    create_before_destroy = true
  }
}