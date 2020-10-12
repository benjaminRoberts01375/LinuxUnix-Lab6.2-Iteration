#!/bin/bash
#file converter.sh
#brief convert cases to upper or lower case
#author benjamin.roberts
#Lecture 6.2 Iteration
#Date 10/11/2020


usage()
{
	echo "$0 usage: [-f input file] [-c U(pper) or L(ower)"
	exit 1
}

while getopts ":f:c:" options;
do
	case "$options" in
		f)	f=$OPTARG
			if [ ! -e "$f" ]
			then
				echo "The requested file does not exist."
				exit
			fi
			;;
		c)	c=$OPTARG
			if [[ $c == "U" || $c == "L" ]];
			then
				echo "$f - $c"
			else
				usage
			fi
			;;
		*)	usage
			;;
	esac
done

#Conversion logic

while read line
do
	if [ $c == "U" ]
	then
		echo $line | tr [:lower:] [:upper:]
	else
		echo $line | tr [:upper:] [:lower:]
	fi
done < $f
