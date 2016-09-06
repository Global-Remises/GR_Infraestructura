#!/bin/bash
#name: create_core.sh
sudo rm -rf /opt/globalremises/core
sudo mkdir -p /opt/globalremises
sudo chown ubuntu:ubuntu /opt/globalremises
mkdir -p /opt/globalremises/core
cd /opt/globalremises/core
git clone  git@github.com:globalremises/GRCore.git .
