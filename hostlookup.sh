#!/bin/bash
#file hostlookup.sh
#brief Looking up the host of things
#author benjamin.roberts
#lab 6.2
#date 10/11/2020

f=$2
echo "$f"

if [ ! -e "$f" ]
then
	echo "The requested file does not exist"
	exit 1
fi

while read line
do
	out=$(host -W1 -t A $line)

	if [ $? -eq 0 ]
	then
		ip=$(echo $out | cut -d ' ' -f 4)
		echo "$line, - $ip"
	else
		echo "$line, - not found"
	fi
done < $f
