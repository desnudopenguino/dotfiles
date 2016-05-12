#!/bin/ksh
# function to quickly list connections and connect to them 

function wifi {
	if [[ $1 == "ls" ]]; then
			sudo ifconfig rtwn0 scan
	elif [[ $1 == "con" ]]; then
		if [[ -z $3 ]]; then
			echo sudo ifconfig rtwnr nwid "$2"
			sudo ifconfig rtwnr nwid "$2"
		else
			echo sudo ifconfig rtwn0 nwid "$2" wpakey $3
			sudo ifconfig rtwn0 nwid "$2" wpakey $3
		fi
		sudo dhclient rtwn0
	elif [[ $1 == "down" ]]; then
		sudo ifconfig rtwn0 down
	elif [[ $1 == "up" ]]; then
		sudo ifconfig rtwn0 up
	fi
}
export wifi
