#!/bin/dash

echo "This script use /dev/video0 or a given device as a mirror."
echo "(show the device in mpv)"

if [ -e "$1" ]; then
    vdev="$1"
else
    vdev="/dev/video0"
fi
mpv -fps 15 tv:// -tv  driver=v4l2:device=$vdev
