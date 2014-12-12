#!/bin/bash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

options=":lLh"

while getopts "$options" opt; do
    case $opt in
        l)
            echo "A B C D E F G H I J K L M"
            echo "A B C D E F G H I J K L M" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
            exit 0
            ;;
        L)
            clear;
            echo "A B C D E F G H I J K L M"
            echo "A B C D E F G H I J K L M" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
            read n;
            exit 0
            ;;
        h)
            echo "This script encrypt a string in rot13."
            echo ""
            echo "usage: rot13.sh [options] [string]"
            echo "-l option shows how the alphabeth is converted"
            echo "-L is the same as -l but clear the screen and wait"
            echo "    for the user to press ENTER to exit"
            echo ""
            exit 0
            ;;
        \?)
            echo "Invalid Option: $opt" >&2
            exit 1
            ;;
    esac
done

echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
