#!/bin/bash
#name:0_bootstrap.sh
echo Ejecutanddo Provisioning
sudo date >> /etc/vagrant_provisioned_at
sudo apt-get update
sudo apt-get upgrade

# Force locale
sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
sudo locale-gen

# Install latest version of Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
touch ~/.ssh/config
echo "Host github.com" >> ~/.ssh/config
echo "HostName github.com" >> ~/.ssh/config
echo "User git" >> ~/.ssh/config
echo "IdentityFile ~/.ssh/id_rsa_github" >> ~/.ssh/config
#sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
sudo service ssh restart