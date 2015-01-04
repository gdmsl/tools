#!/bin/bash

echo "This script shows the computers with ssh port opened in the building B"
echo "of the Fibonacci pole at UNIPI"

nmap -p22 -P0 131.114.11.1-255 | grep -B3 open
