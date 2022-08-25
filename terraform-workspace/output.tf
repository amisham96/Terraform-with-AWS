output "IPAddress" {
  value = aws_instance.my-first-instance.public_ip
}