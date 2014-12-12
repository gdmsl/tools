#!/bin/dash

echo "This scripts finds and convert all the mp3 or m4a files from the"
echo "current directory and convert them to ogg using ffmpeg with the"
echo "libvorbis codec"

find . -type f -name '*.mp3' -exec bash -c 'ffmpeg -y -i "$0" -c:a libvorbis -q:a 4 -vn "${0/%mp3/ogg}"' '{}' \;
find . -type f -name '*.m4a' -exec bash -c 'ffmpeg -y -i "$0" -c:a libvorbis -q:a 4 -vn "${0/%m4a/ogg}"' '{}' \;
