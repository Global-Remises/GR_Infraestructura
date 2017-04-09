#!/bin/bash
#name: download_infrastructure.sh

if [ ! -d '/opt/globalremises' ]; then
	sudo mkdir -p /opt/globalremises
	sudo chown ubuntu /opt/globalremises
fi

if [ ! -d '/opt/globalremises/infrastructure' ]; then
	sudo mkdir -p /opt/globalremises/infrastructure
	sudo chown ubuntu /opt/globalremises/infrastructure
fi

cd /opt/globalremises/infrastructure

if [ "$(ls -A /opt/globalremises/infrastructure)" ]; then
  echo -e "\e[1;31mInfo:\e[0m Repository Exists" >&2
else
  git clone git@github.com:globalremises/GR_Infraestructura.git .
fi