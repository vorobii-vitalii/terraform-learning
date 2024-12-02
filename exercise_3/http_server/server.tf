
module "security_group" {
  source = "../security_group"
  group_name = "Allow HTTP"
  open_tcp_port = 80
}

resource "aws_instance" "httpserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  security_groups = [module.security_group.security_group_name]
  user_data = file("${path.module}/init.sh")
}

output "instance_id" {
  value = aws_instance.httpserver.id
}