#!/bin/bash
#name: delete_database.sh
#Author: Felix E. Orduz G. <felix.orduz@gmail.com>
#Description: delete database.

psql --username postgres --no-password --port 5432 --host localhost -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'globalremises' AND pid <> pg_backend_pid();"

dropdb -p 5432 -h localhost --if-exists --username globalremises --no-password -e globalremises
