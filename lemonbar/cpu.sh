#!/bin/bash

#Get the CPU usage
usagePerc="$(calc 100 - $(mpstat | sed '1,3d;s/.* //'))%"
echo $(./format_right.sh "cpu" "  $usagePerc")

