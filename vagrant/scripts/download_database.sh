#!/bin/bash
#name: download_database.sh
echo "Creando Repositorio Base De Datos Global Remises"
sudo rm -rf /opt/globalremises/database
sudo mkdir -p /opt/globalremises/database
sudo chown ubuntu:ubuntu /opt/globalremises/database
cd /opt/globalremises/database
git clone git@github.com:globalremises/GR_Infraestructura.git .
echo "Base de datos descargada por favor ejecute restore_database.sh"