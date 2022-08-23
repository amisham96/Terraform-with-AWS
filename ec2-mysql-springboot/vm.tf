resource "aws_instance" "my-first-instance" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [var.security_group]
  associate_public_ip_address = true
  # user_data                   = file("${path.module}/scripts/startup.sh")

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y --fix-missing",
      "sudo apt-get install openjdk-11-jre-headless -y",
      "sudo apt-get install maven -y",
      "sudo apt-get install mysql-server mysql-client -y",
      "sudo git clone https://github.com/amisham96/employeemgmt-mysql.git",
      "sudo chmod 777 /home/ubuntu/employeemgmt-mysql/",
      "cd /home/ubuntu/employeemgmt-mysql/",
      "mvn clean install",
      "nohup java -jar /home/ubuntu/Springboot_H2-database_CRUD/target/*.jar > log.log 2>&1 &"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("${path.module}/ssh/mykey.pem")
    }
  }
}