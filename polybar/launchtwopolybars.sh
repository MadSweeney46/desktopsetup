#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
i=0

for m in $(polybar --list-monitors | cut -d":" -f1); do
	##WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}')
	MONITOR=$m polybar bar$i &
	#polybar bar$i &
	echo $m
	echo $i
	echo bar$i
	((i=i+1))
done
echo "Polybars launched..."
