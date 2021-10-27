#!/bin/bash
sudo yum update -y
sudo chown -R ec2-user:ec2-user /opt
cd /opt
sudo yum install wget -y
wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u282-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
mv jdk8u282-b08 java8
sudo sed -i '$a export JAVA_HOME=/opt/java8' /etc/profile
sudo sed -i '$a export PATH=$PATH:/opt/java8/bin' /etc/profile
source /etc/profile
cd 
cd /opt
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
tar -zxvf apache-maven-3.8.1-bin.tar.gz
mv apache-maven-3.8.1 maven3
sudo sed -i '$a export M2_HOME=/opt/maven3' /etc/profile
sudo sed -i '$a export PATH=$PATH:/opt/maven3/bin' /etc/profile
source /etc/profile
cd
cd /opt
wget https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz
tar -zxvf apache-tomcat-8.5.65.tar.gz
mv apache-tomcat-8.5.65 tomcat8
cd tomcat8/
cd bin/
sh startup.sh 
cd
cd /opt/tomcat8/webapps
wget https://updates.jenkins-ci.org/download/war/2.288/jenkins.war
sudo yum install fontconfig -y
cd
cd /opt/tomcat8
cd bin/
sh shutdown.sh
sh startup.sh

