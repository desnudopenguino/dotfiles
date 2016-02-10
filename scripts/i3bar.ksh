#!/bin/ksh
while :
do
	cpu=`top -bn1 | grep 'CPUs' | sed -n 's/.*, *\([0-9.]*\)%* id.*/\1/p' | awk '{print 100 - $1"%"}'`
	date=`date +"%y/%m/%d"`
	clock=`date +"%H:%M:%S"`
echo " " $cpu " " $date " " $clock
	sleep 2
done
