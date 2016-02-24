#!/bin/ksh
while :
do

	# Network Data
set -A connections `ifconfig | grep 'UP,BRO' | cut -d : -f 1`
net_output=" "
for i in ${connections[@]}
do
	active=`ifconfig $i | grep 'status: active'`
	media=`ifconfig $i | grep 'media'|  cut -d : -f 2 | cut -d ' ' -f 2`
	if [[ -n $active ]]; then
	if [[ $media == "Ethernet" ]]; then
		media_type=`ifconfig $i | grep 'media' | cut -d \( -f 2 | cut -d ' ' -f 1`
		media_ip=`ifconfig $i | grep 'inet' | cut -d ' ' -f 2`
		net_output="$net_output   $media_ip $media_type"
	elif [[ $media == "IEEE802.11" ]]; then
		wifi_ssid=`ifconfig $i | grep ieee80211 | cut -d ' ' -f 3`
		wifi_power=`ifconfig $i | grep ieee80211 | cut -d ' ' -f 8`
		media_ip=`ifconfig $i | grep inet | cut -d ' ' -f 2`
		net_output=$net_output"   $media_ip $wifi_ssid $wifi_power"
	fi
fi
done
	# CPU
	cpu_speed=`sysctl hw.cpuspeed | cut -d = -f 2`
	cpu=`top -bn1 | grep 'CPUs' | sed -n 's/.*, *\([0-9.]*\)%* id.*/\1/p' | awk '{print 100 - $1"%"}'`
	cpu_temp=`sysctl hw.sensors.acpithinkpad0.temp0 | cut -d = -f 2 | cut -d . -f 1`

	# Memory
	mem=`top -bn1 | grep 'Memory'`
	used_mem=`top -bn1 | grep 'Memory' | cut -d ' ' -f 3`
	free_mem=`top -bn1 | grep 'Memory' | cut -d ' ' -f 6`
	cache_mem=`top -bn1 | grep 'Memory' | cut -d ' ' -f 8`
	swap_mem=`top -bn1 | grep 'Memory' | cut -d ' ' -f 10`

	# Date/Time
	date=`date +"%d/%m/%y"`
	clock=`date +"%H:%M:%S"`

	# Power
	power=`sysctl hw.sensors.acpiac0.indicator0 | cut -d = -f 2 | cut -d ' ' -f 1`
	if [[ $power == "On" ]]; then
		power_icon=""
	elif [[ $power == "Off" ]]; then
		power_icon=""

cur_bat=$(sysctl hw.sensors.acpibat0.watthour3 | cut -d = -f 2 | cut -d ' ' -f 1)
full_bat=$(sysctl hw.sensors.acpibat0.watthour0 | cut -d = -f 2 | cut -d ' ' -f 1)
		typeset -i cur_bat_pct full_bat_pct charge_pct
		cur_bat=`echo $cur_bat*10000 | bc`
		full_bat=`echo $full_bat*100 | bc`
		avg=`echo $cur_bat/$full_bat | bc`
		if [[ $avg -gt 75 ]]; then
			power_icon=" $avg%"
		elif [[ $avg -le 75 && $avg -gt 50 ]]; then
			power_icon=" $avg%"
		elif [[ $avg -le 50 && $avg -gt 25 ]]; then
			power_icon=" $avg%"
		elif [[ $avg -le 25 && $avg -gt 5 ]]; then
			power_icon=" $avg%"
		elif [[ $avg -le 5 ]]; then
			power_icon="  $avg%"
		fi
	fi

	# final output
echo "$net_output   "$cpu_speed"Mhz " $cpu $cpu_temp"°   "$used_mem"/"$free_mem"   "$date"   "$clock"  "$power_icon
	sleep 5
done
