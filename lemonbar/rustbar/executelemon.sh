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


#################
# Build the bar #
#################


#echo -e "%{l}${bspwm}%{c}${datetime}%{r}%{A:./lemonapplauncher.sh "pavucontrol":}${audio}%{A}${memory}${cpu}${batterymonitor}%{O-4}"

./main | lemonbar -p \
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
