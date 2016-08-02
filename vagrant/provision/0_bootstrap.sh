#!/bin/bash
#name:0_bootstrap.sh
echo Ejecutanddo Provisioning
sudo date >> /etc/vagrant_provisioned_at
sudo apt-get update
sudo apt-get upgrade