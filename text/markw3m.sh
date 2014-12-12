#!/bin/bash

echo "This script shows a markdown document in w3m."
echo ""
echo "usage: markw3m.sh [-r] filename [w3m options]"
echo "       if -r is provided the file will be decoded/encoded with rot13"

options=":r"
rot=false

while getopts "$options" opt; do
    case $opt in
        r)
            rot=true
            ;;
        \?)
            echo "Invalid Option: $opt" >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

filename="$1"
shift

if $rot; then
    cat "$filename" | tr 'A-Za-z' 'N-ZA-Mn-za-m' | markdown | w3m -T text/html $@
else
    markdown "$filename" | w3m -T text/html $@
fi

