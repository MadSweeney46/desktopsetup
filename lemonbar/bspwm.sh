#!/bin/bash

#Define the bspwm workspaces
desktops=$(bspc query -D --names | tac )
focused=$(bspc query -D --names -d focused)
visibleDs=$(bspc query -D -d .active --names)
occupiedDs=$(bspc query -D -d .occupied --names)
bspwmdesktops=""
prevColor=#323d43
curColor=""

lemon_icon () {
lemon_arrow_b_color="#323d43"
  if [ "$focused" = "x1" ]; then
    lemon_arrow_b_color="#87c095"
  elif [[ ${visibleDs[*]} =~ "x1" ]]; then
    lemon_arrow_b_color="#d8caac"
  elif [[ ${occupiedDs[*]} =~ "x1" ]]; then
    lemon_arrow_b_color="#e39b7b"
  fi
  bspwmdesktops="%{B#d9bb80} \uf094 %{B}%{B$lemon_arrow_b_color}%{F#d9bb80}\uE0B0%{F}%{B}"$bspwmdesktops
}

format_bspwm_ws () {
  curColor=$1
  bspwmdesktops="%{B$curColor}   $2   %{B}%{B$prevColor}%{F$curColor}\uE0B0%{F}%{B}$bspwmdesktops"
  prevColor=$1
}

for desktop in $desktops; do
  if [ ! -z "$(echo $visibleDs | grep $desktop)" ]; then
    if [ ${desktop:1} -eq ${focused:1} ]; then
      format_bspwm_ws "#87c095" "$desktop"
    else
      format_bspwm_ws "#d8caac" "$desktop"
    fi
  elif [ ! -z "$(echo $occupiedDs | grep $desktop)" ]; then
    format_bspwm_ws "#e39b7b" "$desktop"
  else
    format_bspwm_ws "#323d43" "$desktop"
  fi
  #echo $bspwmdesktops
done

#bspwmdesktops=$(echo $bspwmdesktops | sed "s/ %{/%{/g")

#desktops=$(echo $desktops | sed "s/%{F-} %{B/%{F-} %{B/g")
#desktops=$(echo $desktops | sed "s///g")
#desktops=$(echo $desktops | sed "s/$focused/%{+u}_$focused\_%{-u}/")
bspwmdesktops=$(echo $bspwmdesktops | sed "s/x//g")
lemon_icon
echo "bspwm" $bspwmdesktops

