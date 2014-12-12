#!/bin/bash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
# DESCRIPTION: Simple program that, given a file with a list of words
#              returns an infinite (until Ctrl-C) string of that words
#              in random order
#

INFILE=""

if [ -f $1 ]; then
	INFILE=$1;
else
	echo "No input file specified. Exiting."
	exit
fi

ROWS=`wc -l $INFILE | awk '{ print $1 }'`

i=0
declare -a LINES
for line in `cat $INFILE`; do
	LINES[$i]="$line"
	((i++))
done

while [ true ]; do
	number=$((RANDOM % ROWS))
	echo -n "${LINES[$number]}   "
done
