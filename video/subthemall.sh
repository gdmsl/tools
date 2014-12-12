#!/bin/dash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

echo "This script downloads recursively all the subtitles for the video"
echo "files in the current directory"

for file in `ls -1 *.{mp4,avi,mkv}`; do
	subdl --lang=ita "$file"
done
