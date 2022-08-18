resource "aws_instance" "my-first-instance" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.mykey.key_name
  security_groups             = [var.security_group]
  associate_public_ip_address = true
  # user_data                   = file("${path.module}/script/startup.sh")

  /*provisioner "file" {
    source      = "script/data.sh"
    destination = "/tmp/startup.sh"
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("${path.module}/ssh/id_rsa")
    }
  }*/

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y --fix-missing",
      "sudo apt install openjdk-11-jre -y",
      "sudo apt install maven -y",
      "sudo git clone https://github.com/amisham96/Springboot_H2-database_CRUD.git",
      "sudo chmod 777 /home/ubuntu/Springboot_H2-database_CRUD/",
      "cd /home/ubuntu/Springboot_H2-database_CRUD/",
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