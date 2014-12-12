#!/bin/dash

#
# AUTHOR: Guido Masella <guido.masella@gmail.com>
#

# execute a process and notify when it's launched and when its exited

notify-send --app-name=oversee -t 5000 "Oversee Start" \
	"Started to monitor the process:\n $*"
$*
notify-send --app-name=oversee -t 5000 "Oversee Stop" \
	"A process stopped with exit status $?:\n$*"
