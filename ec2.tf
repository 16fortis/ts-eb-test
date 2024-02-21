# EC2 Instance configuration
resource "aws_instance" "example_instance" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id
  tags = {
    Name = "Instance-${count.index}"
  }
}


# Variable definition
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 5
}
# Data source for AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}