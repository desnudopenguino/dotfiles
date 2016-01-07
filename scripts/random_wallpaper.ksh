#!/bin/ksh

walls=~/.backgrounds

cd $walls

while (true)
do
	set *

	shift $(($RANDOM % $#))

	feh --bg-scale $walls/$1

	sleep 300
done
