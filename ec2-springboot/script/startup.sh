#!/bin/bash
sudo apt-get update -y
sudo apt-get install mysql-server mysql-client -y
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Welcome@123';" | sudo mysql -u root