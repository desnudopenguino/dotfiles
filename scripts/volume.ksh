#!/bin/ksh

function vol
{
	mixerctl "outputs.master=$1,$1"
}
export vol

function volup
{
 typeset -i volume
 volume=`mixerctl outputs.master | cut -d = -f 2 | cut -d , -f 1`
 volume=$volume+25
	mixerctl "outputs.master=$volume,$volume" >> /dev/null

}
export volup

function voldown
{
 #>> /dev/null
 typeset -i volume
 volume=`mixerctl outputs.master | cut -d = -f 2 | cut -d , -f 1`
 volume=$volume-25
	mixerctl "outputs.master=$volume,$volume" >> /dev/null
}
export voldown
