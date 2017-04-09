#!/bin/bash
#name: core_run.sh

pwd=$(pwd)

if [ ! -d '/opt/globalremises/code/grcore' ]; then
	bash ./core_download.sh
	bash ./core_select_develop.sh
	bash ./core_create.sh
fi

if [ ! -x '/opt/globalremises/code/grcore/target/grcore.jar' ]; then
	bash ./core_create.sh
fi

java -jar target/grcore.jar

cd $pwd
