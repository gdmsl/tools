#!/bin/bash
# Author: Guido Masella <guido.masella@gmail.com>

# simple script to download audio file with descriptions of TV shows
# for blind peoples from the rai.tv website
# (italian public television network)

# works, maybe
# can be improved, surely

# not a great idea
if [ $# -ne 2 ]; then
    echo "Usage: raiaudio.sh <url of the show> <outfile>"
    exit 1
fi

# this line is ugly and inefficient
URL=`wget -q -O - "$1" | grep "audioUrl = " | awk '{print $4}' | awk 'BEGIN{ RS="\""} NR>1 {sub(/".*/,"");print; }' | grep "http"`;

if [ $? -ne 0 ]; then
    echo "An error occurred."
    exit 1
fi

wget -O "$2.mp3" "$URL";

# another bad idea
TYPE=`file -b --mime-type "$2.mp3"`
if [ TYPE != "audio/mpeg" || TYPE != "audio/mp3" ]; then
    echo  -e "\n\n\n"
    echo "ERROR: the audio $2.mp3 is not a valid mp3 audio. Please check."
    exit 2
fi
