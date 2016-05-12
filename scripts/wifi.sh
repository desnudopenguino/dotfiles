#!/bin/sh

# function to quickly list connections and connect to them
function wifi {
	if [ $1 -eq "ls" ]; then
		if [ -z $2 ]; then
			sudo ifconfig rtwn0 scan | grep $2
		else
			sudo ifconfig rtwn0 scan
		fi
	elif [ $1 -eq "con" ]; then
		if [ -z $3 ]; then
			sudo ifconfig rtwn0 nwid "$2" wpakey $3
		elif [ -z $2 ]; then
			sudo ifconfig rtwnr nwid "$2"
		fi
		sudo dhclient rtwn0
	fi
}
export wifi
