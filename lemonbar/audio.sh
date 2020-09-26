#!/bin/bash

volume=$(amixer -q | grep -A5 Master | grep '%' | cut -d'[' -f2 | cut -d'%' -f1)
DIRECTORY=$(cd `dirname $0` && pwd)
#echo $DIRECTORY
echo $volume
echo $($(echo $DIRECTORY)/format.sh "audio" $(echo $volume"%")) > "$(echo $DIRECTORY)/panel_fifo" &
