#!/bin/bash


PORT="2022"


echo "1. Envio de cabecera"

echo "DMAM" | nc localhost $PORT

DATA=`nc -l $PORT`

if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: Header enviado incorrecto"
	exit 1
fi

echo "placeholder" | nc localhost $PORT
