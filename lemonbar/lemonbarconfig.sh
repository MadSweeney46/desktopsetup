#!/bin/bash

trap 'Update' 5

background="#2dd"

Update(){
  echo -e "%{l}$(./bspwm.sh) %{c}$(Format $(./datetime.sh)) %{r}$(Format $(./cpu.sh)) $(Format $(./batterymonitor.sh))"
}

Format() {
	echo "%{+u}%{B$background} $1 %{B}%{-u}"
}

while true; do
    Update
    sleep 5s &
    wait
done







#run each applet in subshell and output to fifo
while :; do $(./bspwm.sh); sleep 0.1s; done > "$fifo" &
while :; do media; mpc idle player; done > "$fifo" &
while :; do pacheck; sleep 60m; done > "$fifo" &
while :; do volume; sleep 0.5s; done > "$fifo" &
while :; do clock; sleep 30s; done > "$fifo" &
while :; do launcher; break; done > "$fifo" &

#################
# Build the bar #
#################

while read -r line ; do
    case $line in
        workspaces*)
            workspaces="${line:10}"
            ;;
        media*)
            media="${line:5}"
            ;;
        pacheck*)
            pacheck="  ${line:7}  "
            ;;
        volume*)
            volume="  ${line:6}  "
            ;;
        clock*)
            clock="  ${line:5}"
            ;;
        launcher*)
            launcher="${line:8}"
            ;;
    esac
    printf "%s\n" "${workspaces}%{c}${media}%{r}${pacheck}${volume}${clock}${launcher}"
done < "$fifo" | lemonbar \
    -g "$panel_dimensions" \
    -f "$font_bar:size=$font_bar_size" \
    -f "$backup_font:size=$font_bar_size" \
    -f "$icon_font:size=$font_bar_size" \
    -a 20 \
    -B "$color_bg" \
    -F "$color_fg" \
    | bash; exit

