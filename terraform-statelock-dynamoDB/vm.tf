resource "aws_instance" "my-first-instance" {
  ami                         = "ami-08d4ac5b634553e16"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [var.security_group]
  associate_public_ip_address = true
  # user_data                   = file("${path.module}/scripts/startup.sh")
}