#!/bin/bash

#Define the bspwm workspaces
desktops=$(bspc query -D --names)
focused=$(bspc query -D --names -d focused)

#empty=$(echo "")
#focused=$(echo "")
#focusedEmpty=$(echo "")
#focusedOccupied=$(echo "")

for desktop in $desktops; do
	desktop=$(echo "$desktop")
        nodes=$(bspc query -N -d $desktop)
	if [ ! -z "$nodes" ]; then
		desktops=$(echo $desktops | sed "s/$desktop/%{F#ff0000}$desktop%{F-}/")
        fi
        
        if [ ! $desktop -eq $focused ]; then
          desktops=$(echo $desktops | sed "s/$desktop/%{B#d8caac}$desktop%{B}/")
        #else
          #desktops=$(echo $desktops | sed "s/$desktop/%{B#e39b7b}$desktop%{B}/")
        fi
        #echo $desktops
done
desktops=$(echo $desktops | sed "s/ //g")
desktops=$(echo $desktops | sed "s/$focused/%{+u}_$focused\_%{-u}/")
echo "bspwm" $desktops | sed "s/_//g"
