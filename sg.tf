resource "aws_security_group" "sample_sg" {
  name        = "sample-sg"
  description = "Sample Security Group"
  vpc_id      = aws_vpc.example_vpc.id
}