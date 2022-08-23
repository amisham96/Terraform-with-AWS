resource "aws_key_pair" "mykey" {
  key_name   = var.key_name
  public_key = file("${path.module}/../ssh/mykey.pem.pub")
}

output "key-name" {
  value = aws_key_pair.mykey.key_name
}