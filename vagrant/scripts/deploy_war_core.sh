#!/bin/bash
#name: deploy_war_core.sh
java -jar /opt/java/payara-micro.jar --deploy /opt/globalremises/grcore.war --domainConfig /opt/java/domain.xml --port 8080 --outputUberJar /opt/java/grcoreapp.jar
java -jar /opt/java/grcoreapp.jar
