variable "access_key" {

}

variable "secret_key" {

}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     = "mykey"
}

variable "instance_type" {
  type        = map(string)
  description = "instance type for ec2"
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
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