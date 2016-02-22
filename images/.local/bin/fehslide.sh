#!/bin/bash

if [ -d $1 ]; then
    feh --slideshow-delay 10 --title fehslide $1/* -g 800x600 --draw-tinted --image-bg black --scale-down --randomize;
fi
