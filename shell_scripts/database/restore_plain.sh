#!/bin/bash
#name: restore_plain.sh
#Author: Felix E. Orduz G. <felix.orduz@gmail.com>
#Description: create database.


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
FILE='./backup.sql'
PORT='5432'
USERNAME='globalremises'

while getopts ":d::f::h::p::u:" opt; do
	case $opt in
		d)
			DBNAME=$OPTARG
		;;
		f)
			FILE=$OPTARG
		;;
		h)
			HOST=$OPTARG
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

CMD="psql --host $HOST --port $PORT --username $USERNAME --no-password -f \"$FILE\" $DBNAME "
eval $CMD
