#!/bin/bash
if [[ $# -ge 3 ]]; then
	pos=1
	if [[ -d $1 ]]; then
		dir=1
	else
		dir=2
	fi

	if [[ -f $2 ]]; then
		fil=1
	else
		fil=2
	fi

	for nat in ${@:3}; do 
	if [[ nat -le $(date +%Y) ]]; then
		dat=1
	else
		dat=2
	fi
	done
else
	pos=0
	echo Hacen falta parametros
fi

if [[ dir -eq 2 ]]; then
	echo La ruta $1 no es un directorio
fi

if [[ fil -eq 2 ]]; then
	echo El archivo $2 no existe
fi

if [[ dat -eq 2 ]]; then
	echo Año de generación inválido
fi

if [[ pos -eq 1 ]] && [[ dir -eq 1 ]] && [[ fil -eq 1 ]] && [[ dat -eq 1 ]]; then
	cd $1
	for year in ${@:3}; do
		mkdir $year
	done 
fi

