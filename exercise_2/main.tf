provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "httpserver" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.allow_http_group.name]
  user_data = file("${path.module}/init.sh")
}

resource "aws_security_group" "allow_http_group" {
  name = "Allow HTTP"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_http_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_http_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.httpserver.id
}

output "public_ip" {
  value = aws_eip.elasticip.public_ip
}
