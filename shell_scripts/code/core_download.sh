#!/bin/bash
#name: core_download.sh

if [ ! -d '/opt/globalremises/code/grcore' ]; then
	sudo mkdir -p /opt/globalremises/code/grcore
	sudo chown ubuntu /opt/globalremises/code/grcore
fi

cd /opt/globalremises/code/grcore

if [ "$(ls -A /opt/globalremises/code/grcore)" ]; then
  echo -e "\e[1;31mInfo:\e[0m Repository Exists" >&2
else
  git clone git@github.com:globalremises/GRCore.git .
fi