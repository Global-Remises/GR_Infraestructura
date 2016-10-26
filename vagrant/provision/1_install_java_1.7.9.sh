#!/bin/bash
#name: install_java_1.7.9.sh
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
sudo mkdir -p /opt/java
sudo chown ubuntu:ubuntu /opt/java
mv jdk-7u79-linux-x64.tar.gz /opt/java
cd /opt/java
tar -zxvf jdk-7u79-linux-x64.tar.gz
rm jdk-7u79-linux-x64.tar.gz
sudo update-alternatives --install "/usr/bin/java" "java" /opt/java/jdk1.7.0_79/bin/java 1
sudo update-alternatives --install "/usr/bin/javac" "javac" /opt/java/jdk1.7.0_79/bin/javac 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" /opt/java/jdk1.7.0_79/bin/javaws 1
sudo update-alternatives --install "/usr/bin/jar" "jar" /opt/java/jdk1.7.0_79/bin/jar 1