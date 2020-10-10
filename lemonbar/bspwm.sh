#!/bin/bash

#Define the bspwm workspaces
desktops=$(bspc query -D --names | tac )
focused=$(bspc query -D --names -d focused)
visibleDs=$(bspc query -D -d .active --names)
occupiedDs=$(bspc query -D -d .occupied --names)
#empty=$(echo "")
#focused=$(echo "")
#focusedEmpty=$(echo "")
#focusedOccupied=$(echo "")
bspwmdesktops=""
#echo desktops
#echo $desktops
prevColor=#323d43
curColor=""
for desktop in $desktops; do
        if [ ! -z "$(echo $visibleDs | grep $desktop)" ]; then
          if [ ${desktop:1} -eq ${focused:1} ]; then
            curColor=#87c095            
            bspwmdesktops="%{B$curColor}$desktop %{B}%{B$prevColor}%{F$curColor}\uE0B0%{F}%{B} $bspwmdesktops"
            prevColor=#87c095
          else
            curColor=#d8caac
            bspwmdesktops="%{B$curColor}$desktop %{B}%{B$prevColor}%{F$curColor}\uE0B0%{F}%{B} $bspwmdesktops"
            prevColor=#d8caac
          fi
        elif [ ! -z "$(echo $occupiedDs | grep $desktop)" ]; then
          curColor=#e39b7b
          bspwmdesktops="%{B$curColor}$desktop %{B}%{B$prevColor}%{F$curColor}\uE0B0%{F}%{B} $bspwmdesktops"
          prevColor=#e39b7b
        else
          curColor=#323d43
          bspwmdesktops="%{B$curColor}$desktop %{B}%{B$prevColor}%{F$curColor}\uE0B0%{F}%{B} $bspwmdesktops"
          prevColor=#323d43
        fi
        #echo $bspwmdesktops
      done

#bspwmdesktops=$(echo $bspwmdesktops | sed "s/ %{/%{/g")

#desktops=$(echo $desktops | sed "s/%{F-} %{B/%{F-} %{B/g")
#desktops=$(echo $desktops | sed "s///g")
#desktops=$(echo $desktops | sed "s/$focused/%{+u}_$focused\_%{-u}/")
bspwmdesktops=$(echo $bspwmdesktops | sed "s/x//g")
echo "bspwm" $bspwmdesktops


