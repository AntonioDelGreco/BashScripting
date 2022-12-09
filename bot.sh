#!/bin/bash
#Script por Diego Ezequiel Antonio Del Greco

mostrarClimaActual(){
	clima=$(curl wttr.in/Bahia+Blanca?0)
	echo -e "${clima[@]}\n"
}

mostrarHora(){
	hora=$(date "+%H")
	minutos=$(date "+%M")

  if [[ $hora -gt 12 ]]
  then
    echo En este momento son las $(date "+%I:%M") PM.
  elif [[ $hora -eq 12 && $munitos -gt 0 ]]
  then
		echo En este momento son las $(date "+%I:%M") PM.
  else	
		echo En este momento son las $(date "+%I:%M") AM.
  fi
}

echo -e "\nBuen dia, $SUDO_USER!"
echo Pulse 1: Mostrar hora.
echo Pulse 2: Mostrar clima actual en Bahia Blanca.
echo Pulsar Cualquien otra tecla finaliza el programa.
read -p "Opcion? " opcion

while true
do
	clear
	case $opcion in
		"1") mostrarHora;;
		"2") mostrarClimaActual;;
		*) break;; 
	esac
	echo -e "\n"
	read -p "Opcion? " opcion
done
