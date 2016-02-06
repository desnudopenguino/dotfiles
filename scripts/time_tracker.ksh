#!/bin/ksh -vx
# Time Tracker is a set of functions that can be implemented in ksh to keep
# track of time spent working on a project. 

# create a new log file
function newLog {
session=$(tmux list-pane -F '#S' | head -1)
date=$(date +"%d_%m_%y")
filename=~/"work_logs/$session-$date.csv"
touch $filename
echo "$filename created..."
}
export newLog

# start the current work time with the date and start time
function startLog {
out=$(date +"%m/%d/%y")
start=`calculateQuarter`
out="$out\t$start\t"
session=$(tmux list-pane -F '#S' | head -1)
date=$(date +"%d_%m_%y")
filename=~/"work_logs/$session-$date.csv"
printf "$out" >> $filename
echo "Start time: $start"
}
export startLog

# append the end time, time worked, and comments to the current work line
function stopLog {
date=$(date +"%d_%m_%y")
end=`calculateQuarter`
session=$(tmux list-pane -F '#S' | head -1)
filename=~/"work_logs/$session-$date.csv"
echo "End time: $end"
start=`getStart`
time_worked=`calculateDuration $start $end`
echo "Time Worked: $time_worked"
if [[ $# -eq 1 ]]; then
	message=$1
	out="$end\t$time_worked\t$message\n"
echo "Comment: $message"
else
	out="$end\t$time_worked\n"
fi
printf "$out" >> $filename
}
export stopLog

# calculate the quarter for time (currently 15 mins, can be changed though
function calculateQuarter {
typeset -i min hr qtr rmnd calc_min calc_hr minimum middle
minimum=15
middle=$minimum/2
OIFS=$IFS
IFS=':'
set -A arr $(date +"%H:%M")
IFS=$OIFS
hr=${arr[0]}
min=${arr[1]}
qtr=$min/$minimum
rmnd=$min%$minimum
if [[ $rmnd -gt $middle ]]; then
qtr=$qtr+1
fi
calc_min=$qtr*$minimum
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

# Get the start time from the file
function getStart {
session=$(tmux list-pane -F '#S' | head -1)
date=$(date +"%d_%m_%y")
filename=~/"work_logs/$session-$date.csv"
line=$(tail -n 1 $filename)
set -A arr $line
start_time=${arr[1]}
printf $start_time
}
export getStart

# calculate the duration between two HH:MM times
function calculateDuration {
typeset -i start_secs end_secs duration_secs duration_mins duration_hrs

start_secs=`calculateSeconds $1`

end_secs=`calculateSeconds $2`

duration_secs=$end_secs-$start_secs
duration_hrs=$duration_secs/3600
duration_mins=$duration_secs%3600/60

if [[ $duration_mins -eq 0 ]]; then
typeset -L duration_mins
duration_mins=00
fi

duration="$duration_hrs:$duration_mins"
printf $duration
}
export calculateDuration

# calculane the number of seconds in an HH:MM time
function calculateSeconds {
typeset -i hr_mins mins secs
OIFS=$IFS
IFS=':'
set -A new_time $1
IFS=$OIFS

hr_mins=${new_time[0]}*60
mins=$hr_mins+${new_time[1]}
secs=$mins*60

printf $secs
}
export calculateSeconds

# gets the current amount of time worked
function currentLog {
start=`getStart`
now=`date +"%H:%M"`
duration=`calculateDuration $start $now`
printf "Time Worked: $duration\n"
}

# get the total hours for this day
function dayLog {

}

# Test function
function testing {
start_time=`getStart`
end_time=`calculateQuarter`
calculateDuration $start_time $end_time


}
export testing
