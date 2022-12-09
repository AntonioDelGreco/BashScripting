#!/bin/bash
#Script por Diego Ezequiel Antonio Del Greco

aleatorio=$((1+$RANDOM % 50))
vidas=0

msgVidas(){
	if [[ $1 -ge 1 && $1 -le 5 ]]
	then
		return 1
	else
		return 2
	fi
}

numEnRango(){
	if [[ $1 -ge 1 && $1 -le 50 ]]
	then
		return $1
	else
		while true
		do
			read -p "Su numero no se encuentra en el rango, ingrese uno nuevamente: " newNum
			if [[ $newNum -ge 1 && $newNum -le 50 ]]
			then
				return $newNum
			else
				continue
			fi
		done
	fi
}

echo -e "\nIntente encontrar el numero que la maquina esta pensando."
echo -e "\nEs un numero entre el 1 y el 50 y solo tiene 10 intentos.\n"
read -p "Su numero? " numUsuario
((vidas++))

numEnRango $numUsuario
num=$?

while true
do
	clear
	if [[ $num -eq $aleatorio ]]
	then
		msgVidas $vidas
		msg=$?
		case $msg in 
			"1") echo "FELICITACIONES ACERTO EN LOS PRIMEROS 5 INTENTOS, USANDO $vidas INTENTOS.";;
			"2") echo "Felicitaciones acerto en los ultimos 5 intentos, usando $vidas intentos";;
		esac
		break
	elif  [[ $num -lt $aleatorio ]]
	then
		echo -e "\nEl numero que ingreso es MENOR que el de la maquina, y usaste $vidas intentos.\n"
		if [[ $vidas -eq 10 ]]
		then
			echo -e "\nNo ha conseguido superar a la maquina, intente mas tarde...\n"
			break
		fi
	else
		echo -e "\nEl numero que ingreso es MAYOR que el de la maquina, y usaste $vidas intentos.\n"
		if [[ $vidas -eq 10 ]]
		then 
			echo -e "\nNo ha conseguido superar a la maquina, intente mas tarde...\n"
			break
		fi
	fi
	((vidas++))
	read -p "Ingrese nuevamente un numero: " num
done










