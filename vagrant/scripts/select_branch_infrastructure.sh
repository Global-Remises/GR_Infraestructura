#!/bin/bash
#name: select_branch_infrastructure.sh

if [ -z "$1" ]; then 
	echo -e "\e[1;31mError:\e[0m Argument is necessary" >&2
	exit;
fi
if [ ! -d '/opt/globalremises/infrastructure' ]; then
	bash ./download_infrastructure.sh
fi

cd /opt/globalremises/infrastructure
git checkout $1
git pull origin $1