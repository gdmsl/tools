#!/bin/bash

echo "This script check which machines are up with ssh in the laboratories"
echo "of the building B of the Fibonacci pole at UNIPI"

nmap -p22 -P0 131.114.11.{101-140,191-200,201-240} | grep -B3 open;
