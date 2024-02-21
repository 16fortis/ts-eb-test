#application load balancer listener
resource "aws_alb_listener" "sample_listener" {
  load_balancer_arn = aws_alb.sample_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.sample_tg.arn
  }
}


# Application Load Balancer Configuration
resource "aws_alb" "sample_alb" {
  name               = "sample-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sample_sg.id]
  subnets            = [aws_subnet.example_subnet1.id, aws_subnet.example_subnet2.id]

  enable_deletion_protection = false

  tags = {
    Name = "SampleALB"
  }
}