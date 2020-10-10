#!/bin/bash

volume=$(amixer -q | grep -A5 Master | grep '%' | cut -d'[' -f2 | cut -d'%' -f1)
#echo $DIRECTORY
echo $(./format.sh "audio"  " $volume%")
