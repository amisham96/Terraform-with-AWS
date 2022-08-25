resource "aws_instance" "my-first-instance" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = lookup(var.instance_type, terraform.workspace)
  key_name                    = aws_key_pair.mykey.key_name
  security_groups             = [var.security_group]
  associate_public_ip_address = true
}