#!/bin/bash
#name: create_core.sh
sudo mkdir -p /opt/globalremises/core
sudo chown -R ubuntu:ubuntu /opt/globalremises
cd /opt/globalremises/core
git clone  git@github.com:globalremises/GRCore.git .
