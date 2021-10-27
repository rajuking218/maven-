#!/bin/bash
sudo yum update -y
sudo chown -R ec2-user:ec2-user /opt
cd /opt
mkdir king
wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz 
mv jdk8u312-b07/ java8
wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz
tar -zxvf apache-maven-3.8.3-bin.tar.gz
rm -rf apache-maven-3.8.3-bin.tar.gz
mv apache-maven-3.8.3/ maven3
cd /opt/king
sudo yum install git -y
git clone https://github.com/sriison/Spring-petclinic-project1.git
cd Spring-petclinic-project1/
ls pom.xml
mvn clean package
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz
tar -zxvf apache-tomcat-9.0.54.tar.gz 
rm -rf apache-tomcat-9.0.54.tar.gz
mv apache-tomcat-9.0.54/ tomcate9
cd tomcate9/
cd webapps/
cp /opt/king/Spring-petclinic-project1/target/*.war .
cd /opt
cd tomcate9/
cd bin/
sh startup.sh
http://13.127.78.34:8080/
http://13.127.78.34:8080/petclinic/
