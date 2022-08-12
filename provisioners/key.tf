resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file("${path.module}/ssh/id_rsa.pub")
}