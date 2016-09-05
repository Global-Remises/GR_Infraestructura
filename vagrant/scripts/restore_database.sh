#!/bin/bash
#name: restore_database.sh
echo "Restaurando Base De Datos Globalremises del repositorio (develop)"
cd /opt/globalremises/database
git checkout develop
git pull origin develop
cd database
pg_restore --host localhost --port 5432 --username "globalremises" --dbname "globalremises" --no-password  --verbose "/opt/globalremises/database/database/globalremises.backup"
