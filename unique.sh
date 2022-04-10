#!/bin/bash

COUNT="0";
NOT_UNIQUE="0";

declare -a my_array
mapfile -t my_array < "$1"

size="${#my_array[@]}"

for (( i=0; i<=${size}; i++ ))
do
	for (( y=$size; y>=1; y--))
	do
		if [[ $y -eq $i ]]
		then
			#echo "it is true"
			y=$y-1;
		fi

		if [[ "${my_array[$i]}" == "${my_array[$y]}" ]]
		then	
			COUNT="1"
			break
		fi
	done	
	if [[ "$COUNT" == "0" ]]
	then
		echo "${my_array[$i]}"
	fi
	COUNT="0"
done
