#!/bin/bash
#name: install_java_1.8.21.sh
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
sudo mkdir -p /opt/java
sudo chown ubuntu:ubuntu /opt/java
mv jdk-8u121-linux-x64.tar.gz /opt/java
cd /opt/java
tar -zxvf jdk-8u121-linux-x64.tar.gz
rm jdk-8u121-linux-x64.tar.gz
sudo update-alternatives --install "/usr/bin/java" "java" /opt/java/jdk1.8.0_121/bin/java 1
sudo update-alternatives --install "/usr/bin/javac" "javac" /opt/java/jdk1.8.0_121/bin/javac 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" /opt/java/jdk1.8.0_121/bin/javaws 1
sudo update-alternatives --install "/usr/bin/jar" "jar" /opt/java/jdk1.8.0_121/bin/jar 1
