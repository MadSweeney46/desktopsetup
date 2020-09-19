#!/bin/bash

allDesktops=($(bspc query -D --names))
currentDesktop=$(bspc query -D -d --names)

if [ $1 == "+" ]; then
	if (( currentDesktop < ${allDesktops[${#allDesktops[@]}-1]} ));then
		((currentDesktop=currentDesktop+1))
	else
		((currentDesktop=1))
	fi
elif [ $1 == "-" ]; then
	if (( currentDesktop > 1 )); then
		((currentDesktop=currentDesktop-1))	
	else
		((currentDesktop=${allDesktops[${#allDesktops[@]}-1]} ))
	fi
fi

echo $currentDesktop
