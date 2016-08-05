cd /opt/globalremises/database
git checkout develop
cd database
pg_restore --host 127.0.0.1 --port 5432 --username "globalremises" --dbname "globalremises" --no-password  --verbose "/opt/globalremises/database/globalremises.backup"