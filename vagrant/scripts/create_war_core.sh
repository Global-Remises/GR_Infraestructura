#!/bin/bash
#name: create_war_core.sh
cd /opt/globalremises/core
git checkout develop
git pull origin develop 
mvn package
mv target/grcore.war /opt/globalremises
