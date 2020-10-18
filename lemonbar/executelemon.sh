#!/bin/bash
###################
# Inital Settings #
###################

panel_dimensions="1920x25+0+0"

#colors and fonts
color_bg="#323d43"
color_fg="#576268"
invert_bg="#fff000"
invert_fg="#000fff"
font_size="15"
icon_size="18"
big_icon_size="19"
font_1="Source Code Pro"
#icon_font_1="ProFont for Powerline"
icon_font_1="Font Awesome 5 Free Solid"
icon_font_2="Powerline Extra Symbols"
icon_font_3="FreeMono"

#check if panel is already running
if [ $(pgrep -cx lemonbar) -gt 0 ] ; then
  printf "%s\n" "The panel is already running." >&2
#  exit 1
fi

#stop processes on kill
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

# remove old panel fifo, create new one
fifo="./panel_fifo"
#[ -e "$fifo" ]
mkfifo "$fifo"

#Audio Widget must be executed manually the first time the lemonbar is launched, otherwise it won't show up since the script gets only triggered during volume changes
echo $(./audio.sh) > "$fifo" &

#run each applet in subshell and output to fifo
#Window manager
bspc subscribe report | while read -r line; do
echo $(./bspwm.sh);
done > "$fifo" &

#Audio
while :; do echo $(./audio.sh); sleep 1s; done > "$fifo" &
#while :; do volume; sleep 0.5s; done > "$fifo" &
#Datetime
while :; do echo $(./datetime.sh); sleep 1s; done > "$fifo" &
#while :; do launcher; break; done > "$fifo" &
#System monitoring
while :; do echo $(./batterymonitor.sh); sleep 10s; done > "$fifo" &
while :; do echo $(./cpu.sh); sleep 10s; done > "$fifo" &
while :; do echo $(./memory.sh); sleep 10s; done > "$fifo" &


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
    cpu*)
      cpu="${line:3}"
      ;;
    memory*)
      memory="${line:6}"
      ;;
    audio*)
      audio="${line:5}"

  esac

echo -e "%{l}${bspwm}%{c}${datetime}%{r}%{A:./lemonapplauncher.sh "pavucontrol":}${audio}%{A}${memory}${cpu}${batterymonitor}%{O-4}"

done < "$fifo" | lemonbar -p \
  -g "$panel_dimensions" \
  -f "$font_1:size=$font_size" \
  -f "$icon_font_1:size=$icon_size" \
  -f "$icon_font_2:size=$big_icon_size" \
  -a 20 \
  -B "$color_bg" \
  -F "$color_fg" \
  | bash; exit

  #-f "$font_2:size=$big_font_size" \
  #-f "$backup_font:size=$font_size" \
  #-f "${font}" \
  #-f "${icon_font}" \ 
