#!/bin/bash
#name: generate_ddl_sql.sh
#Author: Felix E. Orduz G. <felix.orduz@gmail.com>
#Description: Generate one sql file with database structure.

#Trap script exit
trap 'my_exit' SIGINT SIGQUIT
my_exit()
{
	echo "Exit..."
	exit;
 # cleanp commands here if any
}

#Variable
DBNAME='globalremises'
HOST='localhost'
OUTPUT='./ddl.sql'
PORT='5432'
USERNAME='globalremises'

while getopts ":d::h::o::p::u:" opt; do
	case $opt in
		d)
			DBNAME=$OPTARG
		;;
		h)
			HOST=$OPTARG
		;;
		o)
			OUTPUT=$OPTARG
		;;
		p)
			PORT=$OPTARG
		;;
		u)
			USERNAME=$OPTARG
		;;
		\?)
      echo -e "\e[1;31mError:\e[0m Opcion Invalida: -$OPTARG" >&2
      my_exit
    ;;
    :)
      echo -e "\e[1;31mError:\e[0m Opcion -$OPTARG requiere un argumento." >&2
      	my_exit
      ;;
	esac
done;

CMD="pg_dump --host $HOST --port $PORT --username $USERNAME --dbname $DBNAME --no-password --schema-only >> $OUTPUT"
eval $CMD