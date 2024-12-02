provider "aws" {
  region = "eu-west-1"
}

module "ec2" {
  source = "./ec2"
  instance_name = "My EC2"
}

output "module_output" {
  value = module.ec2.ec2_instance_id
}