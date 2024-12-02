provider "aws" {
  region = "eu-west-2"
}

module "server" {
  source = "./http_server"
}

resource "aws_eip" "elasticip" {
  instance = module.server.instance_id
}

output "public_ip" {
  value = aws_eip.elasticip.public_ip
}
