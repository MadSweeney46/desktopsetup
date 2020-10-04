#!/bin/bash

#Define the bspwm workspaces
desktops=$(bspc query -D --names)
focused=$(bspc query -D --names -d focused)
visibleDs=$(bspc query -D -d .active --names)
occupiedDs=$(bspc query -D -d .occupied --names)
#empty=$(echo "")
#focused=$(echo "")
#focusedEmpty=$(echo "")
#focusedOccupied=$(echo "")

for desktop in $desktops; do
	desktopMod=$(echo "$desktop")
        #nodes=$(bspc query -N -d $desktop)
        #echo $desktop
        #echo $desktopMod
	#if [ ! -z "$nodes" ]; then
	#	desktops=$(echo $desktops | sed "s/$desktop/%{F#ff0000}$desktopMod%{F-}/")
        #fi
        
        if [ ! -z "$(echo $visibleDs | grep $desktop)" ]; then

          if [ ${desktop:1} -eq ${focused:1} ]; then
            desktops=$(echo $desktops | sed "s/$desktopMod/%{B#87c095}$desktopMod   %{B}/")
          else

            desktops=$(echo $desktops | sed "s/$desktopMod/%{B#d8caac}$desktopMod   %{B}/")
          fi
        elif [ ! -z "$(echo $occupiedDs | grep $desktop)" ]; then

            desktops=$(echo $desktops | sed "s/$desktopMod/%{B#e39b7b}$desktopMod   %{B}/")
          else
            desktops=$(echo $desktops | sed "s/$desktopMod/$desktopMod   /")
        fi

#        if [ ! ${desktop:1} -eq ${focused:1} ]; then
 #         desktops=$(echo $desktops | sed "s/$desktopMod/%{B#87c095}$desktopMod   %{B}/")
          #echo "notfocused"
  #      else
   #       desktops=$(echo $desktops | sed "s/$desktopMod/%{B#e39b7b}$desktopMod   %{B}/")
          #echo "focused"
    #    fi
        #echo $desktops
done

desktops=$(echo $desktops | sed "s/ %{/%{/g")
#desktops=$(echo $desktops | sed "s/%{F-} %{B/%{F-} %{B/g")
#desktops=$(echo $desktops | sed "s///g")
#desktops=$(echo $desktops | sed "s/$focused/%{+u}_$focused\_%{-u}/")
desktops=$(echo $desktops | sed "s/x//g")
echo "bspwm" $desktops | sed "s/_//g"
