#!/bin/bash
i=1



mcounter=0
anzDesktopsPerMonitor=3
listOfMonitors=$(polybar --list-monitors | cut -d":" -f1)

for m in $(polybar --list-monitors | cut -d":" -f1); do
	((mcounter=mcounter+1))
done

while (( i < (( mcounter*anzDesktopsPerMonitor )))); do
	echo $i
	for k in $listOfMonitors; do
		echo $k " and " $i
		echo bspc monitor $k -a $i
		((i=i+1))
	done	
done
echo ---------------------------------------

echo bspc node -d $(((  $(bspc query -D -d --names) + 1 ))) -f


echo ---------------------------------------

desktops=($(bspc query -D --names))

echo "forstart"
for d in $desktops;do
	echo $d d nr
	echo ${desktops[3]}
	echo ${desktops[${#desktops[@]}-1]}
done


echo ---------------------------------------







