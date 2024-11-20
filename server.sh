#!/bin/bash

PORT="2022"


echo "0. Empezar a escuchar"

DATA=`nc -l $PORT`
HEADER=`echo $DATA | cut -d " " -f 1`
IP=`echo $DATA | cut -d " " -f 2`


if [ "$HEADER" != "DMAM" ]
then
	echo "ERROR 1: Cabecera incorrecta"
	echo "KO_HEADER" | nc $IP $PORT
	exit 1
fi

echo "IP cliente: $IP"

echo "2. CHECK OK - Enviando OK_HEADER"
echo "OK_HEADER" | nc $IP $PORT

DATA=`nc -l $PORT`

if [ "$DATA" == "" ]
then
	echo "ERROR 2: Nombre invalido"
	echo "KO_NAME" | nc $IP $PORT
	exit 1
fi

echo "4. CHECK OK - Enviando OK_NAME"
echo "OK_NAME" | nc $IP $PORT
