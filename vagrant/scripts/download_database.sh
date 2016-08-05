#!/bin/bash
#name: download_database.sh
sudo rm -rf /opt/globalremises/database
sudo mkdir -p /opt/globalremises/database
sudo chown ubuntu:ubuntu /opt/globalremises/database
cd /opt/globalremises/database
git clone git@github.com:globalremises/GR_Infraestructura.git .
