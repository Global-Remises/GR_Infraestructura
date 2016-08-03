#!/bin/bash
#name: 2_install_maven.sh
cd /opt/java
wget http://apache.uniminuto.edu/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -zxvf apache-maven-3.3.9-bin.tar.gz
sudo update-alternatives --install "/usr/bin/mvn" "mvn" /opt/java/apache-maven-3.3.9/bin/mvn 1
