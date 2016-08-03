#!/bin/bash
#name: 1_install_postgres_9.5.sh
sudo touch /etc/apt/sources.list.d/postgresql.list
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main 9.5' > /etc/apt/sources.list.d/postgresql.list"
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.5 postgresql-contrib-9.5

sudo sh -c "echo 'host    all             all             all                     md5' >> /etc/postgresql/9.5/main/pg_hba.conf"
sudo sed -i "s/[# ]*listen_addresses\([[:space:]]*\)=\([[:space:]]*\).*/listen_addresses = '\*'/g" /etc/postgresql/9.5/main/postgresql.conf

# Create database for vagrant user
sudo -u postgres psql -c "CREATE ROLE globalremises LOGIN UNENCRYPTED PASSWORD 'globalremises' SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;"
sudo -u postgres /usr/bin/createdb --echo --owner=globalremises globalremises

sudo systemctl restart postgresql