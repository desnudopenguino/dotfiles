#!/bin/ksh
# Time Tracker is a set of functions that can be implemented in ksh to keep
# track of time spent working on a project. 

function newLog {
session=$(tmux list-pane -F '#S' | head -1)
date=$(date +"%d_%m_%y")
filename=~/"work_logs/$session-$date.csv"
touch $filename
echo "$filename created..."
}
export newLog

function startLog {
out=$(date +"%d/%m/%y")
start=`calculateQuarter`
out="$out\t$start\t"
session=$(tmux list-pane -F '#S' | head -1)
date=$(date +"%d_%m_%y")
filename=~/"work_logs/$session-$date.csv"
printf "$out" >> $filename
echo "Start time: $start"
}
export startLog

function stopLog {
date=$(date +"%d_%m_%y")
end=`calculateQuarter`
session=$(tmux list-pane -F '#S' | head -1)
filename=~/"work_logs/$session-$date.csv"
echo "End time: $end"
if [[ $# -eq 1 ]]; then
	message=$1
	out="$end\t\t$message\n"
echo "Comment: $message"
else
	out="$end\n"
fi
printf "$out" >> $filename
}
export stopLog

function calculateQuarter {
#new_time=$1
OIFS=$IFS
IFS=':'
set -A arr $(date +"%H:%M")
IFS=$OIFS
typeset -i min hr qtr rmnd calc_min calc_hr
hr=${arr[0]}
min=${arr[1]}
qtr=$min/15
rmnd=$min%15
if [[ $rmnd -gt 6 ]]; then
qtr=$qtr+1
fi
calc_min=$qtr*15
calc_hr=$hr
if [[ $qtr -eq 0 ]]; then
typeset -L calc_min
calc_min=00
elif [[ $calc_min -eq 60 ]]; then
typeset -L calc_min
calc_min=00
calc_hr=$hr+1
fi
endTime="$calc_hr:$calc_min"
printf $endTime
}
export calculateQuarter
