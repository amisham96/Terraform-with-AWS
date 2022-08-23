variable "security_group" {
  description = "Name of security group"
  default     = "web-sg"
}

variable "security_group_port" {
  description = "Ports of security group"
  type        = list(number)
  default     = [22, 8080]
}