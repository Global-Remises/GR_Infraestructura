#!/bin/bash
#name: generate_data_backup_binary.sh
#Author: Felix E. Orduz G. <felix.orduz@gmail.com>
#Description: Generate one binary file with data only.

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
OUTPUT='./data.backup'
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

CMD="pg_dump --host $HOST --port $PORT --username $USERNAME --dbname $DBNAME --no-password --data-only --format=custom>> $OUTPUT"
eval $CMD