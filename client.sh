#!/bin/bash

if [ "$1" == "" ]
then
	echo "Indica la direccion del servidor!"
	echo "Ejemplo:"
	echo -e "\t$0 10.40.1.174"
	exit 1
fi


IP_SERVER=$1

IP=`ip a | grep "scope global" | xargs | cut -d " " -f 2 | cut -d "/" -f 1`
PORT="2022"


echo "1. Envio de cabecera"

echo "DMAM $IP" | nc $IP_SERVER $PORT

DATA=`nc -l $PORT`

if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: Header enviado incorrecto"
	exit 1
fi


echo "3. Envio de nombre"
echo "placeholder" | nc $IP_SERVER $PORT


DATA=`nc -l $PORT`

if [ "$DATA" != "OK_NAME" ]
then
	echo "ERROR 2: Nombre enviado incorrecto"
	exit 1
fi
