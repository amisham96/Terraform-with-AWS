module "key_pair" {
  source = "./key-pair/"
}

module "security-group" {
  source = "./sg/"
}

resource "aws_instance" "my-first-instance" {
  ami                         = "ami-08d4ac5b634553e16"
  instance_type               = var.instance_type
  key_name                    = module.key_pair.key-name
  security_groups             = [module.security-group.security-group-name]
  associate_public_ip_address = true
  # user_data                   = file("${path.module}/scripts/startup.sh")
}