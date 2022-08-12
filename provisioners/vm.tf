resource "aws_instance" "my-first-instance" {
  ami                         = "ami-08d4ac5b634553e16"
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.mykey.key_name
  security_groups             = [var.security_group]
  associate_public_ip_address = true
  # user_data                   = file("${path.module}/scripts/startup.sh")
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install apache2 -y"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("${path.module}/ssh/id_rsa")
    }
  }
}