#!/bin/bash
sudo git clone https://github.com/amisham96/employeemgmt-mysql.git
sudo chmod 777 /home/ubuntu/employeemgmt-mysql/
cd /home/ubuntu/employeemgmt-mysql/
mvn clean install
java -jar /home/ubuntu/employeemgmt-mysql/target/*.jar