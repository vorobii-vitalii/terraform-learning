
variable "instance_name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-02141377eee7defb9"
  instance_type = "t1.micro"
  tags = {
    instance_name: var.instance_name
  }
}

output "ec2_instance_id" {
  value = aws_instance.ec2.id
}