#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "Not enough parameters"
	exit 1
fi

load=0
if [ $1 -eq 1 ]; then
	load=$(uptime | awk -F'average:' '{print $2}'|awk -F, '{print $1}'|tr -d '[:space:]')
elif [ $1 -eq 5 ]; then
	load=$(uptime | awk -F'average:' '{print $2}'|awk -F, '{print $2}'|tr -d '[:space:]')
elif [ $1 -eq 15 ]; then
	load=$(uptime | awk -F'average:' '{print $2}'|awk -F, '{print $3}'|tr -d '[:space:]')
fi
echo "OK|load=$load"
