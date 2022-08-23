#!/bin/bash
sudo apt-get update -y --fix-missing
sudo apt-get install openjdk-11-jdk-headless -y
sudo apt-get install maven -y
sudo apt-get install mysql-server mysql-client -y
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Welcome@123';" | sudo mysql -u root
sudo killall apt-get