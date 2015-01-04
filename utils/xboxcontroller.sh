#!/bin/bash

# setting the default vendorid and productid
vendor="0e6f"
product="0301"

# checking for vendorid in the script arguments
if [ -n "$1" ]; then
    vendor=$1
fi

# checking for productid in the script arguments
if [ -n "$2" ]; then
    product=$2
fi

echo "This script will start xboxdrv detaching the default kernel drivers"
echo "usage: xboxcontroller.sh [vendorid] [productid]"


# starting the xboxdrivers with super user provileges (gksudo)
gksudo "xboxdrv --mimic-xpad --device-by-id $vendor:$product --type xbox360 --detach-kernel-driver"
