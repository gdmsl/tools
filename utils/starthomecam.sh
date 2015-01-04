#!/bin/bash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
# DESCRIPTION: Simple script to start an mpv instance in order to play rtsp
#              stream from ip cameras at home
#

echo "Start an rtsp stream to a webcam from my DVR"
echo "usage: starthomecam.sh <host> <user> <password> <channel>"


# getting arguments
if [ -n $1 ]; then
    host=$1
else
    exit 1
fi

shift

if [ -n $1 ]; then
    user=$1
else
    exit 1
fi

shift

if [ -n $1 ]; then
    password=$1
else
    exit 1
fi

shift

if [ -n $1 ]; then
    channel=$1
else
    exit 1
fi


# starting the stream
mpv --title="homecam$channel" "rtsp://$host:554/user=$user&password=$password&channel=$channel&stream=0.sdp?real_stream--rtp-caching=100"

echo "starting stream:"
echo -e "\t rtsp://$host:554/user=$user&password=$password&channel=$channel&stream=0.sdp?real_stream--rtp-caching=100"
