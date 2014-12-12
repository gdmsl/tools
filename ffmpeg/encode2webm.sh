#!/bin/dash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

echo "This script will encode a file to a standard web quality webm format"
echo " -> Standard web video (480p at 600kbit/s)"
echo ""
echo "usage: encode2webm.sh inputfile outputfile"
echo "       (output filename without webm extension)"
echo ""

if [ ! -f "$1" ]; then
    echo "ERROR: no such input file" >&2
    exit 1
fi

if [ -z "$2" ]; then
    echo "ERROR: you need to provide an output filename (without extension)" >&2
    exit 1
fi

ffmpeg -i "$1"  -codec:v libvpx -quality good -cpu-used 0 -b:v 600k -maxrate 600k -bufsize 1200k -qmin 10 -qmax 42 -vf scale=-1:480 -threads 4 -codec:a vorbis -b:a 128k -strict -2 "$2.webm"
