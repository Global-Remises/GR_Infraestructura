#!/bin/bash
#name: core_select_branch.sh

if [ -z "$1" ]; then 
	echo -e "\e[1;31mError:\e[0m Argument is necessary" >&2
	exit;
fi
if [ ! -d '/opt/globalremises/code/grcore' ]; then
	bash ./core_download.sh
fi

cd /opt/globalremises/code/grcore
git checkout $1
git pull origin $1