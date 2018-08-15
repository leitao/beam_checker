#!/bin/bash

for i in $(cat configs.txt); do
	if [[ $(grep $i .config) ]]; then
		echo -n "Y  "
	else
		echo -n "N  "
	fi
	echo $i
	grep $i .config

	echo ----
done

