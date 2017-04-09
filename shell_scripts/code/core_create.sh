#!/bin/bash
#name: core_create.sh
#
pwd=$(pwd)

cd /opt/globalremises/code/grcore
mvn -PVagrant-Local clean install

cd $pwd