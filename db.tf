# Create a MySQL database instance
resource "aws_db_instance" "example_mysql" {
      allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "mydb"
  username             = "user"
  password             = "password"
  parameter_group_name = "default.my"
}

resource "aws_db_subnet_group" "example_db_subnet_group" {
  name       = "mydb-subnet-group"
  subnet_ids = [aws_subnet.example_subnet1.id, aws_subnet.example_subnet2.id]  # Include the ID of the new subnet you created
  #availability_zone = resource.aws_availability_zones.available.names[0]
  tags = {
    Name = "My DB Subnet Group"
  }
}