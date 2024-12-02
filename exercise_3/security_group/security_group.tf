
variable "open_tcp_port" {
  type = number
}

variable "group_name" {
  type = string
}

resource "aws_security_group" "allow_http_group" {
  name = var.group_name
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_http_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_tcp_port
  ip_protocol       = "tcp"
  to_port           = var.open_tcp_port
}

resource "aws_vpc_security_group_egress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_http_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_tcp_port
  ip_protocol       = "tcp"
  to_port           = var.open_tcp_port
}

output "security_group_name" {
  value = aws_security_group.allow_http_group.name
}
