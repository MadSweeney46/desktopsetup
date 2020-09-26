#!/bin/bash

if [ ! -z $1 ]; then
  path="$(echo $HOME)/.config/lemonbar/audio.sh"
  if [ $1 == "+" ]; then
	pactl set-sink-volume @DEFAULT_SINK@ +1000
        $path
  elif [ $1 == "-" ]; then
	pactl set-sink-volume @DEFAULT_SINK@ -1000
        $path
  elif [ $1 == "m" ]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
        $path
  else
        echo "no matching case"
  fi
else
  echo "nothing to do"
fi
