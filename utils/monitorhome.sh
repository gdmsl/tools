#!/bin/bash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
# DESCRIPTION: simple script to create a i3 workspace with all the
#              streams from home.
#


starter="$TOOLSPATH/utils/starthomecam.sh"
wsname=" CAMS"

# getting address and cretentials
host=$(zenity --entry --text="Enter the Hostname:")
if [ $? -ne 0 ]; then
    exit 1
fi
user=$(zenity --entry --text="Enter the Username:")
if [ $? -ne 0 ]; then
    exit 1
fi
pass=$(zenity --password --text="Enter the Password")
if [ $? -ne 0 ]; then
    exit 1
fi
maxchannels=$(zenity --entry --text="Number of channels to display:")
if [ $? -ne 0 ]; then
    exit 1
fi


# starting the workspace
i3-msg "workspace \"$wsname\"; append_layout $I3SESSIONS/homecameras.json;"


# starting the streams
for i in `seq 1 $maxchannels`
do
	i3-msg "workspace \"$wsname\"; exec --no-startup-id $starter $host $user $pass $i;"
    echo "$starter $host $user $pass $i;"
done
