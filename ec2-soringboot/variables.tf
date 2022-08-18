variable "access_key" {

}

variable "secret_key" {

}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     = "mykey"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "web-sg"
}

variable "security_group_port" {
  description = "Ports of security group"
  type        = list(number)
  default     = [22, 8080]
}