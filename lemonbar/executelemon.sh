#!/bin/bash
###################
# Inital Settings #
###################

panel_dimensions="1920x25+0+0"
barpid="$$"

  #colors and fonts
  color_bg="$background"
  color_fg="$foreground"
  invert_bg="$darkgrey"
  invert_fg="$background"
  pacheck_color="$magenta"

  #check if panel is already running
  if [ $(pgrep -cx lemonbar) -gt 0 ] ; then
    printf "%s\n" "The panel is already running." >&2
    exit 1
  fi

  #stop processes on kill
  trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

  # remove old panel fifo, create new one
  fifo="/tmp/panel_fifo"
  [ -e "$fifo" ] && rm "$fifo"
  mkfifo "$fifo"

  #run each applet in subshell and output to fifo
  while :; do echo $(./bspwm.sh); sleep 5.1s; done > "$fifo" &
    #while :; do media; mpc idle player; done > "$fifo" &
    #while :; do pacheck; sleep 60m; done > "$fifo" &
    #while :; do volume; sleep 0.5s; done > "$fifo" &
    while :; do echo $(./datetime.sh); sleep 1s; done > "$fifo" &
      #while :; do launcher; break; done > "$fifo" &
      while :; do echo $(./batterymonitor.sh); sleep 3s; done > "$fifo" &
        #################
        # Build the bar #
        #################

        while read -r line ; do
          case $line in
            bspwm*)
              bspwm="${line:5}"
              ;;
            datetime*)
              datetime="${line:8}"
              ;;
            batterymonitor*)
              batterymonitor="${line:14}"
              ;;
          esac
          echo "%{l}${bspwm}%{c}${datetime}%{r}${batterymonitor}"

        done < "$fifo" | lemonbar \
          -g "$panel_dimensions" \
          -f "$font_bar:size=$font_bar_size" \
          -f "$backup_font:size=$font_bar_size" \
          -f "$icon_font:size=$font_bar_size" \
          -a 20 \
          -B "$color_bg" \
          -F "$color_fg" \
          | bash; exit
