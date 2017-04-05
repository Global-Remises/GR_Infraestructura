#!/bin/bash
#name: select_java_version.sh

if [ -z "$1"]; then

	sudo update-alternatives --config "java"
	sudo update-alternatives --config "javac"
	sudo update-alternatives --config "javaws"
	sudo update-alternatives --config "jar" 
else
	echo $1 | sudo update-alternatives --config "java"
	echo $1 | sudo update-alternatives --config "javac"
	echo $1 | sudo update-alternatives --config "javaws"
	echo $1 | sudo update-alternatives --config "jar" 
fi