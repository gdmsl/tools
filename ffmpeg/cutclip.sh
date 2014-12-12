#!/bin/dash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

echo "This script will cut a clip from a video starting from 'starttime'"
echo "and ending after 'endtime' seconds."
echo "'starttime' and 'endtime' can be given in seconds or in the"
echo "hh:mm:ss[.xxx] format"
echo "usage: cutclip.sh inputfile outputfile starttime endtime"
echo ""

if [ ! -f "$1" ]; then
    echo "ERROR: no such input file" >&2
    exit 1
fi

if [ -z "$2" ]; then
    echo "ERROR: you need to provide an output filename (without extension)" >&2
    exit 1
fi


ffmpeg -i "$1"  -ss "$3" -t "$4" -c:v copy -c:a copy -c:s copy -strict -2 -sameq "$2"
