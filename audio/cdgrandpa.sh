#!/bin/bash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

echo "CD to mp3 converter by warden989"
echo "used to convert audiofilms or audiobooks in a single mp3 file"
echo ""
echo "WARNING: make sure you have cdparanoia, lame and ffmpeg installed"

dir="/tmp/cdgrandpa-$RANDOM"
while [ -d "$dir" ]; do
	dir="/tmp/cdgrandpa-$RANDOM"
done
echo "Temporary working dir in $dir ..."

mkdir $dir
cd $dir

echo "Ripping audio in raw wav files ..."
cdparanoia -B &>> cdgrandpa.log

echo "Converting wav files to mp3 ..."
for name in *.wav; do
	echo -e "\t$name"
	lame $name &>> cdgrandpa.log
done


echo "Finding files to merge ..."
files="concat:"

for name in *.mp3; do
	if [ "$files" = "concat:" ]; then
		files="$files$name"
	else
		files="$files|$name"
	fi
done

echo "Merging and converting files ..."
ffmpeg -i "$files" -c:a copy converted.mp3 &>> cdgrandpa.log

mv converted.mp3 $HOME/converted.mp3

echo "Removing temporary dir ..."
rm -R "$dir" &>> cdgrandpa.log


echo "All done. Result can be found in $HOME/converted.mp3"
