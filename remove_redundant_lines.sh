#!/bin/bash

NOT_UNIQUE="0";

declare -a my_array
mapfile -t my_array < "$1"

size="${#my_array[@]}"

for (( i=0; i<=${size}; i++ ))
do
	for (( y=0; y<i; y++ ))
	do
		if [[ "${my_array[$i]}" == "${my_array[$y]}" ]]
		then

			#printf "antoher if is true\n"
			NOT_UNIQUE="1"
			break;
		fi
	done
	#echo "$NOT_UNIQUE"
	if [[ "$NOT_UNIQUE" -eq "0" ]]
	then
		#printf "if is true\n"
		#printf "i: $i"
		echo "${my_array[$i]}"
	fi
	NOT_UNIQUE="0";
done

