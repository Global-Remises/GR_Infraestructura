#!/bin/bash
#name: create_database.sh
#Author: Felix E. Orduz G. <felix.orduz@gmail.com>
#Description: create database.

psql --username postgres --no-password --port 5432 --host localhost -c "CREATE DATABASE globalremises OWNER globalremises;"

