provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-02141377eee7defb9"
  instance_type = "t1.micro"
  security_groups = [aws_security_group.my_security_group.name]
}

variable allowed_ports {
  type = list(number)
  default = [80, 443, 25]
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

resource "aws_security_group" "my_security_group" {
  name = "Allow HTTP"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}
