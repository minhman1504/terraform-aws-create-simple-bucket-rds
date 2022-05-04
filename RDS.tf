resource "aws_db_instance" "app_database" {
  allocated_storage    = 10
  engine               = "postgres"
#   engine_version        = "13.4-R1"

  identifier = "udagram-db-instance"
  
  instance_class       = "db.t3.micro"
  
  db_name              = "app_database"
  username             = "root"
  password             = "root1234"
  
  skip_final_snapshot  = true
  publicly_accessible = true
}

output "rds-endpoint" {
    value = aws_db_instance.app_database.endpoint
}

# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   name                 = "mydb"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
# }