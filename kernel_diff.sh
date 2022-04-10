#!/bin/bash

rm old_config_list.txt
rm new_config_list.txt
rm old+new_config_list.txt

while read line
do
	#printf "\e[1;31m%s\n\e[0m" "$line" | grep CONFIG | sed 's/# //' | sed 's/=y//g' | awk '{ print $1 }' >> oldconfig_list.txt
	echo "$line" | grep CONFIG | sed 's/# //' | sed 's/=.*//' | awk '{ print $1 }' >> old_config_list.txt
done < "oldconfig"

while read line
do
	#printf "\e[1;32m%s\n\e[0m" "$line" | grep CONFIG | sed 's/# //' | sed 's/=y//g' | awk '{ print $1 }' >> newconfig_list.txt
	echo "$line" | grep CONFIG | sed 's/# //' | sed 's/=.*//' | awk '{ print $1 }' >> new_config_list.txt
done < "newconfig"

cat old_config_list.txt >> old+new_config_list.txt
cat new_config_list.txt >> old+new_config_list.txt
